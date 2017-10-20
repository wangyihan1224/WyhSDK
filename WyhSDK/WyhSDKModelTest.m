//
//  WyhSDKModelTest.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/19.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhSDKModelTest.h"
#import <objc/runtime.h>
@implementation WyhSDKModelTest

-(NSString *)textName{
    return @"test test test ";
}

- (NSDictionary<NSString *, id> *)dictionaryForPropertys
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        
        const char* char_f =property_getName(property);
        
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        propertyValue ? [props setObject:propertyValue forKey:propertyName] : [props setObject:@"" forKey:propertyName];
    }
    free(properties);
    return [props copy];
}
@end
