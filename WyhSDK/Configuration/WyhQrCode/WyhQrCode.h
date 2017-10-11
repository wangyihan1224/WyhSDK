//
//  WyhQrCode.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhQrCode : NSObject

/**生成二维码
 *codestr 二维码字符串
 *size 二维码大小
 */
+ (UIImage *)wyhCode:(NSString *)codestr WithSize:(CGFloat)size;

@end
