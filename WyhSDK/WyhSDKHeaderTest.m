//
//  WyhSDKHeaderTest.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/13.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhSDKHeaderTest.h"

@implementation WyhSDKHeaderTest

-(void)brief{
    
    NSLog(@"brief 使用它来写一段你正在文档化的method, property, class, file, struct, 或enum的短描述信息");
}
-(void)setParam:(NSString *)str{
    NSLog(@"%@", str);
   
}
-(float)toCelcius:(float)fromFahrenheit{
    return 1;
}
-(float)toFahrenheit:(float)fromCelcius{
    
    return 1;
}
-(NSString*)getStr:(NSString *)str{
    
    return @"123";
}

/*!
 @brief 生成数组
 @discussion 可以把可变数组转换成数组.
 @param  arr 需要转换的可变数组
 
 @return NSArray 生成的数组
 
 @code
 NSArray *a = [self listApi:[NSMutableArray new]];
 @endcode
 
 @remark 以上都是乱写的。
 */
-(NSArray *)listApi:(NSMutableArray*)arr{
    
    return arr;
}
@end
