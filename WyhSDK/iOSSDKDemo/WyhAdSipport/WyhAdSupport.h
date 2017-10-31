//
//  WyhAdSupport.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhAdSupport : NSObject
/*!brief  获取UUID. */
+(void)getUUID;
/*!brief  获取用户是否限制了广告跟踪. */
+(void)lookIsAdEnabled;
@end
