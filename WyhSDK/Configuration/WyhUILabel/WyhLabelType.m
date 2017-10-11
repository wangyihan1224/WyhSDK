//
//  WyhLabelType.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhLabelType.h"

@implementation WyhLabelType

static WyhLabelType*_normal = nil;

+(WyhLabelType*)normal{
    if (_normal==nil) {
        _normal = [WyhLabelType new];
        _normal.textColor = [UIColor redColor];
        _normal.font = [UIFont systemFontOfSize:12];
        _normal.backgroundColor = [UIColor yellowColor];
    }
    return _normal;
}
+(void)setNormal:(WyhLabelType *)normal{
    if (normal != _normal) {
        _normal = normal;
    }
}
@end
