//
//  FirstViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/9.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wyhBackColor(WYHWHITE);
    
    WyhUIButton *bt2 = WyhUIButton.new;
    bt2
    .wyhUpInside(self, @selector(btaction))
    .wyhText(@"王胖胖按钮")
    .wyhBackColor(WYHRED)
    .wyhf(100, 100,100 , 100);
    
    
    WyhUIButton *bt = WyhUIButton.new;
    bt
    .wyhUpInside(self, @selector(othaction))
    .wyhBackColor(WYHYELLOW)
    .wyhf(100, 300,100 , 100);


    [self.view wyh_addSubView:@[bt,bt2]];
    
}
-(void)btaction{
    WyhSocket *socket = [WyhSocket new];
    [socket socketest];
//    SecondViewController *vc = [SecondViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}
-(void)othaction{
    
    NSLog(@"wo ri ni mama");
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
