//
//  WyhUILabel.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhUILabel.h"
#import <objc/runtime.h>
@implementation WyhUILabel

@synthesize wyhtext = _wyhtext;
@synthesize wyhFont = _wyhFont;
@synthesize wyhTextColor = _wyhTextColor;
@synthesize wyhType = _wyhType;


-(void)setWyhtext:(TextSet)wyhtext{
    objc_setAssociatedObject(self,@selector(wyhtext) , wyhtext, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(TextSet)wyhtext{
    if (!_wyhtext) {

       _wyhtext  = objc_getAssociatedObject(self, _cmd);
    }
     __weak typeof(self) selfBlock = self;
    _wyhtext = ^WyhUILabel *(NSString *text) {
        selfBlock.text = text;
        return selfBlock;
    };
    return _wyhtext;

}
-(void)setWyhFont:(FontSet)wyhFont{
    objc_setAssociatedObject(self,@selector(wyhFont) , wyhFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(FontSet)wyhFont{
    
    if (!_wyhFont) {
        _wyhFont =  objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;

    _wyhFont = ^WyhUILabel *(CGFloat font) {
        selfBlock.font = [UIFont systemFontOfSize:font];
        return selfBlock;
    };
    
    return _wyhFont;
}

-(void)setWyhTextColor:(TextColorSet)wyhTextColor{
    objc_setAssociatedObject(self,@selector(wyhTextColor) , wyhTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(TextColorSet)wyhTextColor{
    
    if (!_wyhTextColor) {
        _wyhTextColor = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;

    _wyhTextColor = ^WyhUILabel *(UIColor *color) {
        selfBlock.textColor = color;
        return selfBlock;
    };
    
    return _wyhTextColor;
}
-(void)setWyhType:(WyhLabelTypeSet)wyhType{
    objc_setAssociatedObject(self,@selector(wyhType) , wyhType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WyhLabelTypeSet)wyhType{
    if (!_wyhType) {
        _wyhType =  objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
   
    _wyhType = ^WyhUILabel *(WyhLabelType *type) {
        
        selfBlock.font = type.font;
        selfBlock.textColor = type.textColor;
        selfBlock.textAlignment = type.textAlignment;
        selfBlock.backgroundColor = type.backgroundColor;
        return selfBlock;
    };
    
    return _wyhType;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
