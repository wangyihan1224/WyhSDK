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

@end
