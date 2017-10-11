//
//  SecondViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/9.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    WyhUILabel *label =  WyhUILabel.new;
//    label.wyhType(WyhLabelType.normal)
//    .wyhf(100, 100, 300, 300);
//
//    UIButton *bt = UIButton.new;
//
//    bt
////    .wyhBackColor([UIColor redColor])
////        .wyhType(WyhButtonType.normal)
//    //    .wyhText(@"1111")
//    //    .wyhBackColor([UIColor grayColor])
//    .wyhf(100, 400, 100, 40);
//
//    UIButton *bt2 = UIButton.new;
//    
//    bt2
////    .wyhBackColor([UIColor redColor])
////    .wyhType(WyhButtonType.normal)
//    .wyhf(100, 500, 100, 40);
//    [self.view wyh_addSubView:@[bt2]];
//    
////    [bt setTitle:@"124" forState:UIControlStateNormal];
//    [bt2 setTitle:@"4231" forState:UIControlStateNormal];
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    bt2.frame = CGRectMake(100, 100, 100, 100);
    bt2.backgroundColor = [UIColor redColor];
    [self.view addSubview:bt2];
    [bt2 addTarget:self action:@selector(btaction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btaction{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)dealloc{
//
//    NSLog(@"销毁了");
//}
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
