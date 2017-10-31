//
//  WyhAddressBookUI.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhAddressBookUI : NSObject
/*!brief  弹出选择联系人界面. */
+(void)choosePerson:(UIViewController *)vc;
/*!brief  查看一个联系人的详细信息. */
+(void)lookPerson:(UIViewController *)vc;
/*!brief  添加新联系人. */
+(void)addPerson:(UIViewController *)vc;

@end
