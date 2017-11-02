//
//  WyhUtil.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhUtil.h"

@implementation WyhUtil
/*ios11适配*/
+(void)WyhAppSet{

    if (@available(iOS 11.0, *)) {
        
            [UITableView appearance].estimatedRowHeight = 0;
            [UITableView appearance].estimatedSectionHeaderHeight =0;
            [UITableView appearance].estimatedSectionFooterHeight =0;
            [UITableView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            [UIScrollView appearance].contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        
        
    }
  
}
+(BOOL)isDevice{
    if (TARGET_IPHONE_SIMULATOR == 1 && TARGET_OS_IPHONE == 1) {
        NSLog(@"模拟器不支持该操作");
        return NO;
    }else{
        return YES;
    }
}
+(CGRect)getStringSize:(NSString *)string withFontSize:(CGFloat)fontSize withMaxWidth:(CGFloat)manWidth{
    
    return [string boundingRectWithSize:CGSizeMake(manWidth, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
}
@end
