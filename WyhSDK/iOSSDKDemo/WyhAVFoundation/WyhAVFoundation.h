//
//  WyhAVFoundation.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/2.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhAVFoundation : NSObject
//生成一个网络视频的缩略图
+(void)thumbnailImageRequest:(CGFloat)timeBySecond;


+(void)playVc:(UIViewController *)vc;

+(void)diyCamere;
@end
