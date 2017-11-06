//
//  WyhAVKit.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/2.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAVKit.h"
#import <AVKit/AVKit.h>
@implementation WyhAVKit

+(void)playMedia:(UIViewController *)vc{
    AVPlayerViewController *playVc = [AVPlayerViewController new];
    
    playVc.player = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]];
    [vc presentViewController:playVc animated:YES completion:nil];
    [playVc.player play];
}
+(void)playMedia:(UIViewController *)vc withFrame:(CGRect)frame{
    
    AVPlayerViewController *playVc = [AVPlayerViewController new];
    
    playVc.player = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]];
    
    playVc.view.frame = frame;
    [vc.view addSubview:playVc.view];
    
    [playVc.player play];
    
}
@end
