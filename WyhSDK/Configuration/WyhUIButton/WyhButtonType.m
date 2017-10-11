//
//  WyhButtonType.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/9.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhButtonType.h"

@implementation WyhButtonType
static WyhButtonType*_normal = nil;

+(WyhButtonType*)normal{
    if (_normal==nil) {
        _normal = [WyhButtonType new];
        [_normal setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _normal.titleLabel.font = [UIFont systemFontOfSize:12];
        _normal.backgroundColor = [UIColor yellowColor];
    }
    return _normal;
}
+(void)setNormal:(WyhButtonType *)normal{
    if (normal != _normal) {
        _normal = normal;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
