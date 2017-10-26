//
//  WyhViewController.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/24.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WyhViewController : UIViewController
/*!
 @brief 添加图片到图层
 @discussion 添加图片到图层某个位置.
 @param  image 图片 rect 图片在图层中位置（0-1） layer 添加到的图层
 
 
 
 @code
 暂无
 @endcode
 
 */
-(void)addImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer;
- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer;
/*!brief  自定义导航栏. */
@property(nonatomic,strong)WyhUIView *wyhNavi;
/*!brief  导航栏名称. */
@property(nonatomic,strong)WyhUILabel *wyhTitle;
@end
