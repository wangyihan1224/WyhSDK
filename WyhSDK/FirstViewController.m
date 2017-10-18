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

    WyhUILabel *lb = WyhUILabel.new;
    lb.wyhFont(24)
     .wyhtext(@"这是一个label这是一个label")
     .wyhx(100)
    .wyhy(500)
    .wyhw(100);
    lb.numberOfLines = 0;
    CGRect rect = [lb.text boundingRectWithSize:CGSizeMake(lb.wyh_w, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : lb.font} context:nil];
    lb.wyhh(rect.size.height);
    
    
//    WyhUIView *v = WyhUIView.new;
//    v
//    .wyhBackColor(WYHRED)
//    .wyhx(100)
//    .wyhh(20)
//    .wyhw(40)
//    .wyhTop(lb, 20);
    
    WyhUIView *v2 = WyhUIView.new;
   
    
    [self.view wyh_addSubView:@[bt,bt2,lb,v2]];
    
    
    v2
    .wyhBackColor(WYHRED)
    .wyhh(276)
    .wyhLeft(bt, 20)
    .wyhRight(self.view, 20)
    .wyhTop(bt, 20)
    ;
    
     NSLog(@"x is %f,y is %f,w is %f,h is %f",self.view.wyh_x,self.view.wyh_y,self.view.wyh_w,self.view.wyh_h);
    NSLog(@"x is %f,y is %f,w is %f,h is %f",v2.wyh_x,v2.wyh_y,v2.wyh_w,v2.wyh_h);
}

-(void)btaction{
    WyhSocket *socket = [WyhSocket new];
    [socket socketest];
//    SecondViewController *vc = [SecondViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}

-(void)othaction{

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
