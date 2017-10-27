//
//  WyhViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/24.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhViewController.h"

@interface WyhViewController ()

@end

@implementation WyhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self makeNavi];
}

-(void)makeNavi{
     self.navigationController.navigationBar.hidden = YES;
    self.view.wyhBackColor(WYHWHITE);
    
    self.wyhNavi = WyhUIView.new;
    self.wyhTitle = WyhUILabel.new;
    self.wyhBackBt = WyhUIButton.new;
    
    [self.view wyh_addSubView:@[self.wyhNavi]];
    [self.wyhNavi wyh_addSubView:@[self.wyhTitle,self.wyhBackBt]];
    
    self.wyhNavi.wyhBackColor(WYHYELLOW).wyhf(0, 0, WYHSCREEMWIDTH, WYHNAVIHEIGHT);
    
    self.wyhTitle.wyhType(WyhLabelType.navititle).wyhRight(self.wyhNavi, 0).wyhw(WYHSCREEMWIDTH).wyhh(24).wyhBottom(self.wyhNavi, 10);
    
    self.wyhBackBt.wyhUpInside(self, @selector(goToBack)).wyhTextColor(WYHRED).wyhText(@"返回").wyhRadio(4).wyhBordColor(WYHRED).wyhBordWidth(1).wyhLeft(self.wyhNavi, 10).wyhh(40).wyhw(60).wyhBottom(self.wyhNavi, 0);
    
    self.wyhBackBt.hidden = YES;
}
-(void)goToBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)addImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer{
    
    layer.contents = (__bridge id)image.CGImage;
    
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    
    //set contentsRect
    layer.contentsRect = rect;
}
- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
    //set contentsCenter
    layer.contentsCenter = rect;
}
-(void)wyhPush:(UIViewController *)viewController{
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
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
