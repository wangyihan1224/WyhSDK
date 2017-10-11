//
//  UIScrollView+WyhUtil.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "UIScrollView+WyhUtil.h"

@implementation UIScrollView (WyhUtil)
//获取table,collection数据总数
-(NSInteger)wyh_totalDataCount{
   
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        
        for (NSInteger section = 0; section<tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    } else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        
        for (NSInteger section = 0; section<collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
    
}
-(void)setWyh_insetT:(CGFloat)wyh_insetT{
    UIEdgeInsets inset = self.contentInset;
    inset.top = wyh_insetT;
    self.contentInset = inset;
}

- (CGFloat)wyh_insetT
{
    return self.contentInset.top;
}

-(void)setWyh_insetB:(CGFloat)wyh_insetB{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = wyh_insetB;
    self.contentInset = inset;
}

- (CGFloat)wyh_insetB
{
    return self.contentInset.bottom;
}

-(void)setWyh_insetL:(CGFloat)wyh_insetL{
    UIEdgeInsets inset = self.contentInset;
    inset.left = wyh_insetL;
    self.contentInset = inset;
}

- (CGFloat)wyh_insetL
{
    return self.contentInset.left;
}

-(void)setWyh_insetR:(CGFloat)wyh_insetR{
    UIEdgeInsets inset = self.contentInset;
    inset.right = wyh_insetR;
    self.contentInset = inset;
}

- (CGFloat)wyh_insetR
{
    return self.contentInset.right;
}

-(void)setWyh_offsetX:(CGFloat)wyh_offsetX{
    CGPoint offset = self.contentOffset;
    offset.x = wyh_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)wyh_offsetX
{
    return self.contentOffset.x;
}

-(void)setWyh_offsetY:(CGFloat)wyh_offsetY{
    CGPoint offset = self.contentOffset;
    offset.y = wyh_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)wyh_offsetY
{
    return self.contentOffset.y;
}

-(void)setWyh_contentW:(CGFloat)wyh_contentW{
    CGSize size = self.contentSize;
    size.width = wyh_contentW;
    self.contentSize = size;
}

- (CGFloat)wyh_contentW
{
    return self.contentSize.width;
}

-(void)setWyh_contentH:(CGFloat)wyh_contentH{
    CGSize size = self.contentSize;
    size.height = wyh_contentH;
    self.contentSize = size;
}

- (CGFloat)wyh_contentH
{
    return self.contentSize.height;
}
@end
