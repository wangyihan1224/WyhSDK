//
//  WyhUIButton.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "WyhButtonType.h"
@class WyhUIButton;
typedef WyhUIButton*(^BtValue) (CGFloat value);
typedef WyhUIButton*(^BtColor) (UIColor *color);
typedef WyhUIButton*(^BtText) (NSString *text);
//typedef WyhUIButton*(^WyhButtonTypeSet) (WyhButtonType *type);
typedef WyhUIButton*(^ActionType) (id actionObject,SEL actionSelect);




@interface WyhUIButton : UIButton

@property(nonatomic,copy,readonly)BtValue wyhFont;//
@property(nonatomic,copy,readonly)BtColor wyhTextColor;
@property(nonatomic,copy,readonly)BtText wyhText;
//@property(nonatomic,copy,readonly)WyhButtonTypeSet wyhType;
@property(nonatomic,copy,readonly)ActionType wyhUpInside;
@end
