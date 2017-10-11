//
//  UIView+WyhUtil.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "UIView+WyhUtil.h"
#import <objc/runtime.h>



@implementation UIView (WyhUtil)



-(void)setWyhx:(FrameSet)wyhx{

    objc_setAssociatedObject(self, @selector(wyhx), wyhx, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static FrameSet _wyhx = nil;
-(FrameSet)wyhx{
    if (!_wyhx) {
        _wyhx = objc_getAssociatedObject(self, _cmd);
    }
     __weak typeof(self) selfBlock = self;
   
    _wyhx = ^UIView *(CGFloat f) {
        selfBlock.wyh_x = f;
        return selfBlock;
    };
    
    return _wyhx;
}
-(void)setWyhy:(FrameSet)wyhy{
    objc_setAssociatedObject(self, @selector(wyhy), wyhy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static FrameSet _wyhy = nil;
-(FrameSet)wyhy{
    if (!_wyhy) {
        _wyhy = objc_getAssociatedObject(self, _cmd);
    }
     __weak typeof(self) selfBlock = self;

    _wyhy = ^UIView *(CGFloat f) {
        selfBlock.wyh_y = f;
         return selfBlock;
    };
    return _wyhy;
}
-(void)setWyhw:(FrameSet)wyhw{
    objc_setAssociatedObject(self, @selector(wyhw), wyhw, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static FrameSet _wyhw = nil;
-(FrameSet)wyhw{
    if (!_wyhw) {
        _wyhw = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
   
    _wyhw = ^UIView *(CGFloat f) {
        selfBlock.wyh_w = f;
         return selfBlock;
    };
    return _wyhw;
}
-(void)setWyhf:(FrameModel)wyhf{
    objc_setAssociatedObject(self, @selector(wyhf), wyhf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static FrameModel _wyhf = nil;
-(FrameModel)wyhf{
    if (!_wyhf) {
        _wyhf = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;

    _wyhf = ^UIView *(CGFloat x,CGFloat y,CGFloat w,CGFloat h) {
        selfBlock.frame = CGRectMake(x, y, w, h);
        return selfBlock;
    };
    return _wyhf;
}
-(void)setWyhh:(FrameSet)wyhh{
    objc_setAssociatedObject(self, @selector(wyhh), wyhh, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static FrameSet _wyhh = nil;
-(FrameSet)wyhh{
    if (!_wyhh) {
        _wyhh = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
    
    _wyhh = ^UIView *(CGFloat f) {
        selfBlock.wyh_h = f;
         return selfBlock;
    };
    return _wyhh;
}

-(void)setWyhs:(SizeSet)wyhs{
    objc_setAssociatedObject(self, @selector(wyhs), wyhs, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static SizeSet _wyhs = nil;
-(SizeSet)wyhs{
    if (!_wyhs) {
        _wyhs = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
  
    _wyhs = ^UIView *(CGSize s) {
        selfBlock.wyh_size = s;
         return selfBlock;
        
    };
    return _wyhs;
}

-(void)setWyho:(RectSet)wyho{
    objc_setAssociatedObject(self, @selector(wyho), wyho, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static RectSet _wyho = nil;
-(RectSet)wyho{
    if (!_wyho) {
        _wyho = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;

    _wyho = ^UIView *(CGPoint r) {
        selfBlock.wyh_origin = r;
         return selfBlock;
    };
    return _wyho;
}

//批量加入子视图
-(void)wyh_addSubView:(NSArray *)views{
    [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:obj];
    }];
}
-(void)setWyh_x:(CGFloat)wyh_x{
    
    CGRect frame = self.frame;
    frame.origin.x = wyh_x;
    self.frame = frame;
}
-(CGFloat)wyh_x{
    
    return self.frame.origin.x;
}
-(void)setWyh_y:(CGFloat)wyh_y{
    CGRect frame = self.frame;
    frame.origin.y = wyh_y;
    self.frame = frame;
}

- (CGFloat)wyh_y
{
    return self.frame.origin.y;
}

-(void)setWyh_w:(CGFloat)wyh_w{
    CGRect frame = self.frame;
    frame.size.width = wyh_w;
    self.frame = frame;
}

- (CGFloat)wyh_w
{
    return self.frame.size.width;
}

-(void)setWyh_h:(CGFloat)wyh_h
{
    CGRect frame = self.frame;
    frame.size.height = wyh_h;
    self.frame = frame;
}

- (CGFloat)wyh_h
{
    return self.frame.size.height;
}

-(void)setWyh_size:(CGSize)wyh_size
{
    CGRect frame = self.frame;
    frame.size = wyh_size;
    self.frame = frame;
}

- (CGSize)wyh_size
{
    return self.frame.size;
}

-(void)setWyh_origin:(CGPoint)wyh_origin
{
    CGRect frame = self.frame;
    frame.origin = wyh_origin;
    self.frame = frame;
}

- (CGPoint)wyh_origin
{
    return self.frame.origin;
}
//-(void)setWyh_isAnimate:(BOOL)wyh_isAnimate{
//    
//    if (wyh_isAnimate) {
//        [CATransaction begin];
//        [CATransaction setDisableActions:YES];
//        
//        self.frame = self.bounds;
//        
//        [CATransaction commit];
//        
//    }else{
//        
//        
//    }
//}

-(void)setWyhRadio:(FrameSet)wyhRadio{
    objc_setAssociatedObject(self, @selector(wyhRadio), wyhRadio, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static FrameSet _wyhRadio = nil;
-(FrameSet)wyhRadio{
    if (!_wyhRadio) {
        _wyhRadio = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;

    _wyhRadio = ^UIView*(CGFloat value){
        [selfBlock.layer setMasksToBounds:YES];
        selfBlock.layer.cornerRadius = value;
        return selfBlock;
    };
    return _wyhRadio;
}
-(void)setWyhBordWidth:(FrameSet)wyhBordWidth{
    objc_setAssociatedObject(self, @selector(wyhBordWidth), wyhBordWidth, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static FrameSet _wyhBordWidth = nil;
-(FrameSet)wyhBordWidth{
    if (!_wyhBordWidth) {
        _wyhBordWidth = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
   
    _wyhBordWidth = ^UIView*(CGFloat value){
        
        selfBlock.layer.borderWidth = value;
        return selfBlock;
    };
    return _wyhBordWidth;
}
-(void)setWyhBackColor:(ColorSet)wyhBackColor{
    objc_setAssociatedObject(self, @selector(wyhBackColor), wyhBackColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static ColorSet _wyhBackColor = nil;
-(ColorSet)wyhBackColor{
    if (!_wyhBackColor) {
        _wyhBackColor = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
 
    _wyhBackColor = ^UIView*(UIColor *color){
        selfBlock.backgroundColor = color;
        return selfBlock;
    };
    return _wyhBackColor;
}
-(void)setWyhBordColor:(ColorSet)wyhBordColor{
    objc_setAssociatedObject(self, @selector(wyhBordColor), wyhBordColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static ColorSet _wyhBordColor = nil;
-(ColorSet)wyhBordColor{
    if (!_wyhBordColor) {
        _wyhBordColor = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
   
    _wyhBordColor = ^UIView*(UIColor *color){
        selfBlock.layer.borderColor = color.CGColor;
        selfBlock.layer.borderWidth = 1;
        return selfBlock;
    };
    return _wyhBordColor;
}

@end
