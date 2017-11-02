//
//  WyhAdSupport.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAdSupport.h"
#import <AdSupport/AdSupport.h>
@implementation WyhAdSupport
+(void)getUUID{
    
 ASIdentifierManager *manager =    [ASIdentifierManager sharedManager];
    NSLog(@"UUID is %@",manager.advertisingIdentifier);
   
}
+(void)lookIsAdEnabled{
    ASIdentifierManager *manager =    [ASIdentifierManager sharedManager];
   
    if ([WyhUtil isDevice]) {
         NSLog(@"用户是否限制了广告跟踪 %@",manager.advertisingTrackingEnabled);
    }else{
         NSLog(@"模拟器不支持该操作");
    }
    
}
@end
