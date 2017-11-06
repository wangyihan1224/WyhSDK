//
//  WyhCFNetwork.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/6.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhCFNetwork.h"
#import <CFNetwork/CFNetwork.h>
@implementation WyhCFNetwork
+(void)createStream{
 //该函数使用 host 以及 port，CFNetwork 会将该 host 转换为 IP 地址，并转换为网络字节顺序。如果我们只需要一个 socket stream，我们可以将另外一个设置为 NULL。还有另外两个“重载”的创建 socket sream的接口：CFStreamCreatePairWithSocket 和 CFStreamCreatePairWithPeerSocketSignature，在这里就不一一介绍了
    CFStringRef host = (__bridge CFStringRef)@"192.168.1.1";
    UInt32 port = 123;
    CFReadStreamRef read = NULL;
    CFWriteStreamRef write = NULL;
    CFReadStreamOpen(read);
    CFWriteStreamOpen(write);
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host, port, &read, &write);
    CFOptionFlags flags = 1;
    CFReadStreamClientCallBack block = NULL;
    CFReadStreamSetClient(read, flags, block, nil);
    CFRunLoopMode mode = NULL;
    CFRunLoopRef runloop = NULL;
    CFReadStreamScheduleWithRunLoop(read, runloop, mode);
   //读取数据：
    CFReadStreamHasBytesAvailable(read);
    UInt8 buffer = NULL;
    CFIndex index = 10;
    CFReadStreamRead(read, &buffer, index);
    //写入数据：
    CFWriteStreamCanAcceptBytes(write);
    CFWriteStreamWrite(write, &buffer, index);
    
    CFReadStreamUnscheduleFromRunLoop(read, runloop, mode);
    
   // 关闭 socket stream
    CFReadStreamClose(read);
    CFWriteStreamClose(write);
    
}
+(void)openThread{
    NSString *serverHost = @"";
    NSString *serverPort = @"";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@:%@",serverHost,serverPort]];
    NSThread *backgroudThread = [[NSThread alloc]initWithTarget:self selector:@selector(loadDataFromServerWithURL:) object:url];
    [backgroudThread start];
}
void socketCallBack(CFReadStreamRef stream,CFStreamEventType event,void * myPtr){
    CFIndex kBufferSize = 8;
    switch (event) {
        case kCFStreamEventHasBytesAvailable:
            
            while (CFReadStreamHasBytesAvailable(stream)) {
                UInt8 buffer[kBufferSize];
                int numBytesRead = CFReadStreamRead(stream, buffer, kBufferSize);
                NSData *data = [NSData dataWithBytes:buffer length:numBytesRead];
            }
            break;
        case kCFStreamEventErrorOccurred:{
            CFErrorRef error = CFReadStreamCopyError(stream);
            if (error!=NULL) {
                if (CFErrorGetCode(error)!=0) {
                    NSString *errorInfo = [NSString stringWithFormat:@"Failed "];
                }
                CFRelease(error);
            }
        }
            case kCFStreamEventEndEncountered:
        {
            CFReadStreamClose(stream);
            CFReadStreamUnscheduleFromRunLoop(stream, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
            CFRunLoopStop(CFRunLoopGetCurrent());
        }
        default:
            break;
    }
}
-(void)loadDataFromServerWithURL:(NSURL *)url{
    NSString *host = [url host];
    NSInteger port = [url port].integerValue;
    
    CFStreamClientContext ctx = {0,(__bridge void *)self,NULL,NULL,NULL};
    
    CFOptionFlags registeredEvents = (kCFStreamEventHasBytesAvailable | kCFStreamEventEndEncountered | kCFStreamEventErrorOccurred);
    
    CFReadStreamRef readStream;
    CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, (__bridge CFStringRef)(host), port, &readStream, NULL);
   
    if (CFReadStreamSetClient(readStream, registeredEvents, socketCallBack, &ctx)) {
        CFReadStreamScheduleWithRunLoop(readStream, CFRunLoopGetCurrent(), kCFRunLoopCommonModes);
    }else{
        return;
    }
    
    if (CFReadStreamOpen(readStream)==NO) {
        return;
    }
    CFErrorRef error = CFReadStreamCopyError(readStream);
    if (error !=NULL) {
        if (CFErrorGetCode(error) != 0) {
            NSString *errorInfo = [NSString stringWithFormat:@"Faild to connect steam;error:%@ (code %ld)",CFErrorGetDomain(error),CFErrorGetCode(error)];
        }
        CFRelease(error);
        return;
    }
    
    CFRunLoopRun();
}

@end
