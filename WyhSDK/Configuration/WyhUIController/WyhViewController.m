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
    
    self.wyhNavi = WyhUIView.new;
    self.wyhTitle = WyhUILabel.new;
    
    [self.view wyh_addSubView:@[self.wyhNavi]];
    [self.wyhNavi wyh_addSubView:@[self.wyhTitle]];
    
    self.wyhNavi.wyhBackColor(WYHYELLOW).wyhf(0, 0, WYHSCREEMWIDTH, WYHNAVIHEIGHT);
    
    self.wyhTitle.wyhType(WyhLabelType.navititle).wyhRight(self.wyhNavi, 0).wyhw(WYHSCREEMWIDTH).wyhh(24).wyhBottom(self.wyhNavi, 10);
    
    NSLog(@"x %f y %f w  %f h %f",self.wyhTitle.wyh_x,self.wyhTitle.wyh_y,self.wyhTitle.wyh_w,self.wyhTitle.wyh_h);
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
