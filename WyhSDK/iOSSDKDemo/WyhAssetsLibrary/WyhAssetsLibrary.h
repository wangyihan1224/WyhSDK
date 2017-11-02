//
//  WyhAssetsLibrary.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/1.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhAssetsLibrary : NSObject

+(void)getAllPhotos;

+(void)enumerateAssets:(NSArray *)arr;

@property(nonatomic,strong)UIImageView *imageview;
@end
