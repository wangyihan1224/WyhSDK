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
@end
