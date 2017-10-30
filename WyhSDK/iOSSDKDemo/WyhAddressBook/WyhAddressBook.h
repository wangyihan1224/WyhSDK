//
//  WyhAddressBook.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/30.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhAddressBook : NSObject
/*!brief  授权. */
+(void)request;
/*!brief  读取联系人信息. */
+(void)getPerson;
/*!brief  新增联系人. */
+(void)newPerson;
@end
