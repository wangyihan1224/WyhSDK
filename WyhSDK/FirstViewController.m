//
//  FirstViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/9.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "WyhSDKModelTest.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.wyhBackColor(WYHWHITE);
    
    WyhUITextField *field =WyhUITextField.new;
    WyhUIButton *bt = WyhUIButton.new;
//    bt.wyhType(WyhButtonType.normal);
    
    [self.view wyh_addSubView:@[field,bt]];
    
    field
    .wyhTop(self.view, 300)
    .wyhLeft(self.view, 100)
    .wyhRight(self.view, 100)
    .wyhh(40)
    .wyhBordWidth(1)
    .wyhBordColor(WYHRED)
    .wyhRadio(4);
    
   bt
    .wyhTop(field, 30)
    .wyhLeft(self.view, 100)
    .wyhRight(self.view, 100)
    .wyhh(40)
    .wyhBackColor(WYHRED)
    .wyhRadio(4);
    
    
//    [[UIButton new] dictionaryForPropertysWithLog:YES];
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
