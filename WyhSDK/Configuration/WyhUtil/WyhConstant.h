//
//  WyhConstant.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#ifndef WyhConstant_h
#define WyhConstant_h
#import <UIKit/UIKit.h>


/*week-blcok*/
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif
/*屏幕尺寸*/
#define WYHSCREEMWIDTH [UIScreen mainScreen].bounds.size.width
#define WYHSCREEMHEIGHT [UIScreen mainScreen].bounds.size.height
#define WYHNAVIHEIGHT 68
/*颜色*/
#define WYHRED  [UIColor redColor]
#define WYHYELLOW  [UIColor yellowColor]
#define WYHWHITE [UIColor whiteColor]
#define WYHBLUE [UIColor blueColor]
#define WYHBLACK [UIColor blackColor]
#endif /* WyhConstant_h */
