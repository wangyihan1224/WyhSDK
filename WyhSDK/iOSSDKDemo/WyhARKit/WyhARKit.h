//
//  WyhARKit.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/31.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ARKit/ARKit.h>
#import <SceneKit/SceneKit.h>
@interface WyhARKit : NSObject

+(ARSCNView*)creatScreen:(UIViewController *)vc;
+(void)runView:(ARSCNView*)sceneView;
+(void)stopView:(ARSCNView*)sceneView;

@end
