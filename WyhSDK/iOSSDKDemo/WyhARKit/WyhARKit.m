//
//  WyhARKit.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhARKit.h"

@interface WyhARKit()<ARSCNViewDelegate>

@end
@implementation WyhARKit
+(ARSCNView*)creatScreen:(UIViewController *)vc{
    
    ARSCNView *sceneView = [[ARSCNView alloc]initWithFrame:CGRectMake(0, 0, WYHSCREEMWIDTH, WYHSCREEMHEIGHT)];
    [vc.view addSubview:sceneView];
    
    //设置视图的委托
    sceneView.delegate = self;
    //显示统计数据，比如fps和计时信息
    sceneView.showsStatistics = YES;
    //创建一个新的场景
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
    
    //将场景设置为视图
    sceneView.scene = scene;
    
    return sceneView;
}

+(void)runView:(ARSCNView*)sceneView{
    //创建一个会话配置
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    //运行视图的会话
    [sceneView.session runWithConfiguration:configuration];
}
+(void)stopView:(ARSCNView*)sceneView{
   
    //暂停视图的会话
    [sceneView.session pause];
}
@end
