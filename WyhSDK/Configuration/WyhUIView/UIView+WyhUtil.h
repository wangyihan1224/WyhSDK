//
//  UIView+WyhUtil.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef UIView *(^FrameSet) (CGFloat f);
typedef UIView *(^SizeSet) (CGSize s);
typedef UIView *(^RectSet) (CGPoint r);
typedef UIView *(^FrameModel) (CGFloat x,CGFloat y,CGFloat w,CGFloat h);
typedef UIView*(^ColorSet) (UIColor *color);
@interface UIView (WyhUtil)
//视图frame单独一个属性设置
@property (assign, nonatomic) CGFloat wyh_x;
@property (assign, nonatomic) CGFloat wyh_y;
@property (assign, nonatomic) CGFloat wyh_w;
@property (assign, nonatomic) CGFloat wyh_h;
@property (assign, nonatomic) CGSize wyh_size;
@property (assign, nonatomic) CGPoint wyh_origin;

@property(nonatomic,copy,readonly)FrameSet wyhx;
@property(nonatomic,copy,readonly)FrameSet wyhy;
@property(nonatomic,copy,readonly)FrameSet wyhw;
@property(nonatomic,copy,readonly)FrameSet wyhh;
@property(nonatomic,copy,readonly)SizeSet wyhs;
@property(nonatomic,copy,readonly)RectSet wyho;
@property(nonatomic,copy,readonly)FrameModel wyhf;


@property(nonatomic,copy,readonly)FrameSet wyhRadio;//
@property(nonatomic,copy,readonly)FrameSet wyhBordWidth;//
@property(nonatomic,copy,readonly)ColorSet wyhBackColor;
@property(nonatomic,copy,readonly)ColorSet wyhBordColor;
////是否开启隐式动画
//@property(nonatomic,assign)BOOL wyh_isAnimate;
//-(UIView *)wyh_layaout;
//批量加入子视图
-(void)wyh_addSubView:(NSArray *)views;
@end
