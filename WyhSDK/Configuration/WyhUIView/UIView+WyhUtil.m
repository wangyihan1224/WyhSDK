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
        selfBlock.currentWidh = [NSNumber numberWithFloat:f];
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
        selfBlock.currentHeight = [NSNumber numberWithFloat:f];
   
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
-(NSNumber *)wyh_topY{
     return objc_getAssociatedObject(self, _cmd);
   
}
-(void)setWyh_topY:(NSNumber *)wyh_topY{
    objc_setAssociatedObject(self, @selector(wyh_topY), wyh_topY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSNumber *)wyh_leftX{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setWyh_leftX:(NSNumber *)wyh_leftX{
    objc_setAssociatedObject(self,@selector(wyh_leftX) , wyh_leftX, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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




-(void)setWyhTop:(LayoutSet)wyhTop{
    objc_setAssociatedObject(self, @selector(wyhTop), wyhTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static LayoutSet _wyhTop = nil;
-(LayoutSet)wyhTop{
    if (!_wyhTop) {
        _wyhTop = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
    
    _wyhTop = ^UIView*(UIView *reference,CGFloat distance){
 
        //设置y坐标。
        
        
        if (selfBlock.superview == reference) {
            
                selfBlock.wyhy(distance);
                
        }else{
                selfBlock.wyhy(reference.wyh_y+reference.wyh_h+distance);
         
        }
        selfBlock.wyh_topY = [NSNumber numberWithFloat:selfBlock.wyh_y];
    //如果设置过底部y坐标，需要设置高度。
        
        if (selfBlock.wyh_bottomY) {
            selfBlock.wyhh(selfBlock.wyh_bottomY.floatValue-selfBlock.wyh_y);
            //缓存高度
            selfBlock.currentHeight = [NSNumber numberWithFloat:selfBlock.wyh_h];
        }
        //如果设置过高度，需要设置底部y坐标
        if (selfBlock.currentHeight) {
            selfBlock.wyh_bottomY = [NSNumber numberWithFloat:selfBlock.wyh_y+selfBlock.currentHeight.floatValue];
        }
        
        
        return selfBlock;
    };
    return _wyhTop;
}

-(void)setWyh_bottomY:(NSNumber *)wyh_bottomY{
    objc_setAssociatedObject(self, @selector(wyh_bottomY), wyh_bottomY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSNumber *)wyh_bottomY{
    return   objc_getAssociatedObject(self, _cmd);
}
-(void)setWyhBottom:(LayoutSet)wyhBottom{
    objc_setAssociatedObject(self, @selector(wyhBottom), wyhBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static LayoutSet _wyhBottom = nil;
-(LayoutSet)wyhBottom{
    if (!_wyhBottom) {
        _wyhBottom = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
    
    _wyhBottom = ^UIView*(UIView *reference,CGFloat distance){

        //设置底部y坐标
        if (selfBlock.superview == reference) {
             selfBlock.wyh_bottomY = [NSNumber numberWithFloat:reference.wyh_h-distance];
           
        }else{
            selfBlock.wyh_bottomY = [NSNumber numberWithFloat:reference.wyh_y-distance];
        }
       
        //如果设置过y坐标，需要设置高度
        if (selfBlock.wyh_topY) {
            selfBlock.wyhh(selfBlock.wyh_bottomY.floatValue-selfBlock.wyh_topY.floatValue);
            //缓存高度
            selfBlock.currentHeight = [NSNumber numberWithFloat:selfBlock.wyh_h];
        }
        
        //如果设置过高度，需要设置y坐标
        if (selfBlock.currentHeight) {
            selfBlock.wyhy(selfBlock.wyh_bottomY.floatValue-selfBlock.currentHeight.floatValue);
            //缓存y坐标
            selfBlock.wyh_topY = [NSNumber numberWithFloat:selfBlock.wyh_y];
        }
        
        
        return selfBlock;
    };
    return _wyhBottom;
}
-(CGFloat)wyh_left{
    return self.frame.origin.x;
}
-(void)setWyh_left:(CGFloat)wyh_left{
    CGRect frame = self.frame;
    frame.origin.x = wyh_left;
    self.frame = frame;
}
-(void)setWyhLeft:(LayoutSet)wyhLeft{
    objc_setAssociatedObject(self, @selector(wyhLeft), wyhLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static LayoutSet _wyhLeft = nil;
-(LayoutSet)wyhLeft{
    if (!_wyhLeft) {
        _wyhLeft = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
    
    _wyhLeft = ^UIView*(UIView *reference,CGFloat distance){
        
     //1.设置x的值。
        
    if (selfBlock.superview == reference) {
        selfBlock.wyhx(distance);
    }else{
        selfBlock.wyhx(reference.wyh_rightX.floatValue+distance);
    }
    //缓存当前x坐标。
    selfBlock.wyh_leftX = [NSNumber numberWithFloat:selfBlock.wyh_x];
        
        //2.如果设置过rx,需要设置w。
        if (selfBlock.wyh_rightX) {
            selfBlock.wyhw(selfBlock.wyh_rightX.floatValue-selfBlock.wyh_x);
            //缓存宽度。
            selfBlock.currentWidh = [NSNumber numberWithFloat:selfBlock.wyh_w];
        }
        //3.如果设置过w,需要设置rx。
        if (selfBlock.currentWidh) {
            //缓存右边x坐标
            selfBlock.wyh_rightX =[NSNumber numberWithFloat:selfBlock.wyh_x+selfBlock.currentWidh.floatValue];
        }
        
        
        return selfBlock;
    };
    return _wyhLeft;
}
-(NSNumber *)currentWidh{
    
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setCurrentWidh:(NSNumber *)currentWidh{
    objc_setAssociatedObject(self, @selector(currentWidh), currentWidh, OBJC_ASSOCIATION_RETAIN);
}
-(NSNumber *)currentHeight{
    
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setCurrentHeight:(NSNumber *)currentHeight{
    objc_setAssociatedObject(self, @selector(currentHeight), currentHeight, OBJC_ASSOCIATION_RETAIN);
}

-(NSNumber *)wyh_rightX{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setWyh_rightX:(NSNumber *)wyh_rightX{
   objc_setAssociatedObject(self, @selector(wyh_rightX), wyh_rightX, OBJC_ASSOCIATION_RETAIN);
}

-(void)setWyhRight:(LayoutSet)wyhRight{
    objc_setAssociatedObject(self, @selector(wyhRight), wyhRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
static LayoutSet _wyhRight = nil;
-(LayoutSet)wyhRight{
    if (!_wyhRight) {
        _wyhRight = objc_getAssociatedObject(self, _cmd);
    }
    __weak typeof(self) selfBlock = self;
    
    _wyhRight = ^UIView*(UIView *reference,CGFloat distance){
       //1.设置rx.
        if (selfBlock.superview == reference) {
            selfBlock.wyh_rightX = [NSNumber numberWithFloat:reference.wyh_w-distance];
        }else{
            selfBlock.wyh_rightX = [NSNumber numberWithFloat:reference.wyh_x-distance];
        }
        
        //2.如果设置过x，需设置w.
        if (selfBlock.wyh_leftX) {
            selfBlock.wyhw(selfBlock.wyh_rightX.floatValue-selfBlock.wyh_x);
            //缓存宽度
            selfBlock.currentWidh = [NSNumber numberWithFloat:selfBlock.wyh_w];
        }
        //如果设置过宽度，需要设置x.
        if (selfBlock.currentWidh) {
            selfBlock.wyhx(selfBlock.wyh_rightX.floatValue-selfBlock.currentWidh.floatValue);
            //缓存x坐标
            selfBlock.wyh_leftX = [NSNumber numberWithFloat:selfBlock.wyh_x];
        }
       

        return selfBlock;
    };
    return _wyhRight;
}


@end
