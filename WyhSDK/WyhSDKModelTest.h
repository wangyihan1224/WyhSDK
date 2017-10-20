//
//  WyhSDKModelTest.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/19.
//  Copyright © 2017年 王乙涵. All rights reserved.
//


#import <Foundation/Foundation.h>
@protocol TestProtocol <NSObject>

- (NSString *)textName;

@end
@interface WyhSDKModelTest : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSString *address;
- (NSDictionary<NSString *, id> *)dictionaryForPropertys;
@end
