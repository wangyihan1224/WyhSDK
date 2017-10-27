//
//  WyhAccelerateViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAccelerateViewController.h"

@interface WyhAccelerateViewController ()

@end

@implementation WyhAccelerateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wyhTitle.wyhtext(@"Accelerate") ;
    self.wyhBackBt.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
