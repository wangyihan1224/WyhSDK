//
//  UIScrollView+WyhUtil.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (WyhUtil)

//获取table,collection数据总数
-(NSInteger)wyh_totalDataCount;
@property (assign, nonatomic) CGFloat wyh_insetT;
@property (assign, nonatomic) CGFloat wyh_insetB;
@property (assign, nonatomic) CGFloat wyh_insetL;
@property (assign, nonatomic) CGFloat wyh_insetR;

@property (assign, nonatomic) CGFloat wyh_offsetX;
@property (assign, nonatomic) CGFloat wyh_offsetY;

@property (assign, nonatomic) CGFloat wyh_contentW;
@property (assign, nonatomic) CGFloat wyh_contentH;
@end
