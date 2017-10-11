
//
//  WyhSocket.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/10.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhSocket.h"

@implementation WyhSocket
-(void)socketest{
    
    NSString *host = @"123.33.33.1";
    NSNumber * port = @1233;
    
    //创建socket
    int socketFileDescriptor = socket(AF_INET, SOCK_STREAM, 0);
    
    if (-1 == socketFileDescriptor) {
        NSLog(@"创建失败");
        return;
    }
    
    //获取ip地址
    struct hostent * remoteHostEnt = gethostbyname([host UTF8String]);
    if (NULL==remoteHostEnt) {
        close(socketFileDescriptor);
        NSLog(@"%@",@"无法解析服务器的主机名");
        return;
    }
    
    struct in_addr *remoteInAddr = (struct in_addr *)remoteHostEnt->h_addr_list[0];
    
    //设置socket参数
    struct sockaddr_in socketParameters;
    socketParameters.sin_family = AF_INET;
    socketParameters.sin_addr = *remoteInAddr;
    socketParameters.sin_port = htons([port intValue]);
    
    //连接socket
    int ret = connect(socketFileDescriptor, (struct sockaddr *)&socketParameters, sizeof(socketParameters));
    if (-1==ret) {
        close(socketFileDescriptor);
        NSLog(@"连接失败");
        return;
    }
    
    NSLog(@"连接成功");
}

@end
