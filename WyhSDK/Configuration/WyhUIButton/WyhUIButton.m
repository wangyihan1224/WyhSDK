//
//  WyhUIButton.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhUIButton.h"
#import <objc/runtime.h>
@interface WyhUIButton()
@property (nonatomic, strong) id actionObject;
@property (nonatomic, assign) SEL actionSelect;
@end
@implementation WyhUIButton
@synthesize wyhFont = _wyhFont;
@synthesize wyhTextColor = _wyhTextColor;
@synthesize wyhText = _wyhText;
@synthesize wyhType = _wyhType;
@synthesize wyhUpInside = _wyhUpInside;

-(void)setWyhFont:(BtValue)wyhFont{
    objc_setAssociatedObject(self, @selector(wyhFont), wyhFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(BtValue)wyhFont{
    __weak typeof(self) selfBlock = self;
    if (!_wyhFont) {
        _wyhFont = objc_getAssociatedObject(self, _cmd);
    }

    _wyhFont = ^WyhUIButton*(CGFloat value){
        
        selfBlock.titleLabel.font = [UIFont systemFontOfSize:value];
        return selfBlock;
    };
    return _wyhFont;
}
-(void)setWyhTextColor:(BtColor)wyhTextColor{
    objc_setAssociatedObject(self, @selector(wyhTextColor), wyhTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(BtColor)wyhTextColor{
    __weak typeof(self) selfBlock = self;
    if (!_wyhTextColor) {
        _wyhTextColor = objc_getAssociatedObject(self, _cmd);
    }
   
    _wyhTextColor = ^WyhUIButton*(UIColor *color){
        [selfBlock setTitleColor:color forState:UIControlStateNormal];
        return selfBlock;
    };
    return _wyhTextColor;
}

-(void)setWyhText:(BtText)wyhText{
    objc_setAssociatedObject(self, @selector(wyhText), wyhText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
-(BtText)wyhText{
    __weak typeof(self) selfBlock = self;
    if (!_wyhText) {
        _wyhText = objc_getAssociatedObject(self, _cmd);
    }
  
    _wyhText = ^WyhUIButton*(NSString *text){
        [selfBlock setTitle:text forState:UIControlStateNormal];
        return selfBlock;
    };
    return _wyhText;
}
-(void)setWyhType:(WyhButtonTypeSet)wyhType{
    objc_setAssociatedObject(self,@selector(wyhType) , wyhType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(WyhButtonTypeSet)wyhType{
    
    __weak typeof(self) selfBlock = self;
    if (!_wyhType) {
        _wyhType = objc_getAssociatedObject(self, _cmd);
    }
   
    _wyhType = ^WyhUIButton *(WyhButtonType *type) {
        
        selfBlock.titleLabel.font = type.titleLabel.font;
        [selfBlock setTitleColor:type.currentTitleColor forState:UIControlStateNormal];
        selfBlock.backgroundColor = type.backgroundColor;
        return selfBlock;
    };
    
    return _wyhType;
}
-(void)setWyhUpInside:(ActionType)wyhUpInside{
    objc_setAssociatedObject(self, @selector(wyhUpInside), wyhUpInside, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(ActionType)wyhUpInside{
     __weak typeof(self) selfBlock = self;
    if (!_wyhUpInside) {
        _wyhUpInside = objc_getAssociatedObject(self, _cmd);
    }
  
    _wyhUpInside = ^WyhUIButton *(id actionObject,SEL actionSelect){
        selfBlock.actionObject = actionObject;
        selfBlock.actionSelect = actionSelect;
        [selfBlock addTarget:selfBlock action:@selector(actionUpInSide:) forControlEvents:UIControlEventTouchUpInside];
        return selfBlock;
    };
    return _wyhUpInside;
}

-(void)actionUpInSide:(WyhUIButton *)sender{
    
    if (sender.actionObject&&sender.actionSelect) {
        [sender.actionObject performSelector:sender.actionSelect];
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
