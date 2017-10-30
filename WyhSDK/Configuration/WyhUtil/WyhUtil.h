//
//  WyhUtil.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIScrollView+WyhUtil.h"
#import "UIView+WyhUtil.h"
#import "WyhImageUtil.h"
#import "NSObject+Wyh.h"
@interface WyhUtil : NSObject

//app初始化设置


+(void)WyhAppSet;

/*!
 @brief 获取字符串高宽
 @discussion 通过字号，字符串内容，最大宽度，获取字符串高宽.
 @param  string 字符串内容
  @param  fontSize 字号大小
  @param  manWidth 字符串最大宽度
 @return CGRect 字符串大小
 
 @code
 
 @endcode
 

 */
+(CGRect)getStringSize:(NSString *)string withFontSize:(CGFloat)fontSize withMaxWidth:(CGFloat)manWidth;
@end
