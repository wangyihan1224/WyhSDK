//
//  WyhUILabel.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WyhLabelType.h"
@class WyhUILabel;
typedef WyhUILabel *(^TextSet) (NSString *text);
typedef WyhUILabel *(^FontSet) (CGFloat font);
typedef WyhUILabel *(^TextColorSet) (UIColor *color);
typedef WyhUILabel *(^WyhLabelTypeSet) (WyhLabelType *type);




@interface WyhUILabel : UILabel

@property(nonatomic,copy,readonly)TextSet wyhtext;
@property(nonatomic,copy,readonly)FontSet wyhFont;
@property(nonatomic,copy,readonly)TextColorSet wyhTextColor;
@property(nonatomic,copy,readonly)WyhLabelTypeSet wyhType;
@end
