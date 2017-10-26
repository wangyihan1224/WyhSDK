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
typedef UIView*(^LayoutSet) (UIView *reference,CGFloat distance);
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

/*!brief  当前视图顶部距离参照视图底部距离. */
@property(nonatomic,copy,readonly)LayoutSet wyhTop;


/*!brief  当前视图底部距离参照视图顶部距离. */
@property(nonatomic,copy,readonly)LayoutSet wyhBottom;
@property(nonatomic)NSNumber *wyh_bottom;

/*!brief  当前视图左边距离参照视图右边距离. */
@property(nonatomic,copy,readonly)LayoutSet wyhLeft;


/*!brief  当前视图右边距离参照视图左边距离. */
@property(nonatomic,copy,readonly)LayoutSet wyhRight;
@property(nonatomic)NSNumber *wyh_right;
/*!brief  当前视图高度. */
@property(nonatomic,strong)NSNumber *currentHeight;
/*!brief  当前视图宽度. */
@property(nonatomic,strong)NSNumber *currentWidh;
////是否开启隐式动画
//@property(nonatomic,assign)BOOL wyh_isAnimate;
//-(UIView *)wyh_layaout;
//批量加入子视图
-(void)wyh_addSubView:(NSArray *)views;



@end
