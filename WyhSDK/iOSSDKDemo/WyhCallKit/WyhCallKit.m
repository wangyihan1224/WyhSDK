//
//  WyhCallKit.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/2.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhCallKit.h"
#import <CallKit/CallKit.h>
@interface WyhCallKit()<CXProviderDelegate>
@end
@implementation WyhCallKit
+(void)prepare{
    //Prepare
    //创建CXProvider，指定Call Kit展现UI中的APP名称和图标，通话数量，来电铃声等Configuration
    static CXProviderConfiguration *configInternal = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configInternal = [[CXProviderConfiguration alloc]initWithLocalizedName:@"WyhSDK"];
        configInternal.supportsVideo = NO;
        configInternal.maximumCallsPerCallGroup = 1;
        configInternal.maximumCallGroups = 1;
        configInternal.supportedHandleTypes = [NSSet setWithObject:@(CXHandleTypePhoneNumber)];
        UIImage *iconMaskImage =[UIImage imageNamed:@"2"];
        configInternal.iconTemplateImageData = UIImagePNGRepresentation(iconMaskImage);
        configInternal.ringtoneSound = @"Ringtone.caf";
    });
    
    CXProvider *provider = [[CXProvider alloc]initWithConfiguration:configInternal];
    [provider setDelegate:self queue:nil];

    //创建CXCallController，使APP可以发送更新状态给Call Service，例如用户拔出电话或者对方挂断电话等状态
    CXCallController *callController = [[CXCallController alloc]init];
    
    CXHandle *handleNumber = [[CXHandle alloc]initWithType:CXHandleTypePhoneNumber value:@""];
    CXStartCallAction *action = [[CXStartCallAction alloc]initWithCallUUID:[NSUUID UUID] handle:handleNumber];
    action.video = NO;
    CXTransaction *transaction = [[CXTransaction alloc]init];
    [transaction addAction:action];
    [callController requestTransaction:transaction completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"requestTransaction erro %@",error);
        }
    }];
    //Incoming Call
    //APP前台时收到来自网络Server端的连接请求，或者APP后台时收到来自网络Push Server的PushEvent.APP收到连接请求或者Push消息后，创建CXCallUpdate对象，指定此次来电的号码等属性
    
    CXCallUpdate *update = [CXCallUpdate new];
    update.hasVideo = NO;
    update.remoteHandle = [[CXHandle alloc]initWithType:CXHandleTypePhoneNumber value:@""];
    //将上面创建的CXCallUpdate对象通过CXProvider的reportNewIncomingCallWithUUID方法报告给iOS系统
    [provider reportNewIncomingCallWithUUID:[NSUUID UUID] update:update completion:^(NSError * _Nullable error) {
       //Call Service收到新的来电请求后根据当前的状态，展现原生来电UI
        
    }];
    
    
   
    //End Call
    //用户点击APP UI中的挂断按钮
    //创建CXEndCallAction对象，指定此次通话的UUID属性
    CXEndCallAction *endAction = [[CXEndCallAction alloc]initWithCallUUID:[NSUUID UUID]];
    CXTransaction *endtranscation = [CXTransaction new];
    //创建CXTransaction，将刚刚的Action指定给它
    [endtranscation addAction:endAction];
    //通过CXCallController，调用requestTransaction将这个挂断事件通知给Call Service
    [callController requestTransaction:endtranscation completion:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"requestTransaction erro %@",error);
        }
    }];
    
    
    
}
//实现CXProviderDelegate协议，以接收来自Call Service发来的更新状态，例如用户点击了接听或者挂断等动作，决定网络链路的处理动作；还有AudioSession的激活状态，决定Audio播放录制的启动关闭时机
- (void)providerDidReset:(nonnull CXProvider *)provider {
    
}
-(void)provider:(CXProvider *)provider performStartCallAction:(CXStartCallAction *)action{
    //Outgoing Call
    //用户通过APP UI、通话录、Siri发起一个拔出请求
    //创建CXHandle指定拨出的电话号码，创建CXStartCallAction并将CXHandle指定给它
    //创建CXTransaction，将刚刚的Action指定给它
    //通过CXCallController，调用requestTransaction将这个拔出事件通知给Call Service
    //Call Service收到新的拨出请求后根据当前的状态，通过CXProvider将拨出动作通知回APP
    //APP在CXProviderDelegate中的performStartCallAction中开启此次呼叫的网络链路，通过CXProvider的reportOutgoingCallWithUUID设置呼叫与接通时间，根据链路建立的结果来展现原生呼叫UI的状态（呼叫成功或者失败）
    [provider reportOutgoingCallWithUUID:[NSUUID UUID] connectedAtDate:[NSDate date]];
    
}
-(void)provider:(CXProvider *)provider performAnswerCallAction:(CXAnswerCallAction *)action{
    //Answer Call
    //用户点击来电界面上的接听按钮
    //Call Service通过CXProvider的Delegate协议performAnswerCallAction方法告知APP
    //APP将接听命令通过网络传给对端，开始实际音频数据传输，进行通话
    
    NSUUID *currentID = [NSUUID UUID];
//    [action fulfill];
//    [action fail];
    
    
}
-(void)provider:(CXProvider *)provider performEndCallAction:(CXEndCallAction *)action{
    //Call Service通过当前通话状态，通过CXProvider将挂断动作通知回给APP
    //APP在CXProviderDelegate中的performEndCallAction中结束此次通话的网络链路，停止音频录制播放Loop
    
}
@end
