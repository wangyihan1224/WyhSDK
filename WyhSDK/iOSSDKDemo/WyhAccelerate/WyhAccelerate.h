//
//  WyhAccelerate.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//
/*!
 @header WyhAccelerate.h
 
 @brief 基于Accelerate.Framework.
 
 Accelerate主要是用来做数字信号处理、图像处理相关的向量、矩阵运算的库。.
 
 @author 王乙涵
 @copyright  2017 王乙涵
 @version    1.0.0
 
 */
#import <Foundation/Foundation.h>

@interface WyhAccelerate : NSObject
/*!
 @brief 图像模糊
 @discussion 通过vImage实现图片模糊效果.
 @param  image 需要做模糊的图片
 @param  blur 模糊度度数(0~1)。
 @return UIImage 返回一个模糊效果的图片
 
 @code
 
 @endcode
 
 @remark 模糊算法使用的是vImageBoxConvolve_ARGB8888这个函数
 */
+ (UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
