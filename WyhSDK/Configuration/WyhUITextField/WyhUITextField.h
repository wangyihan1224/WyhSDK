//
//  WyhUITextField.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WyhUITextField;
typedef WyhUITextField*(^FieldValue) (CGFloat value);


@interface WyhUITextField : UITextField
@property(nonatomic,copy,readonly)FieldValue wyhFont;

@end
