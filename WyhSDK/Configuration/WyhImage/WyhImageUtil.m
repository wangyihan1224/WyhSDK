//
//  WyhImageUtil.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhImageUtil.h"


@implementation WyhImageUtil
+(UIImage *)wyhMirror:(UIImage *)image{
   
//    //1.创建AVCaptureSession
//    AVCaptureSession *session = [AVCaptureSession new];
//    
//    if ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//        [session setSessionPreset:AVCaptureSessionPreset640x480];
//    }else{
//        [session setSessionPreset:AVCaptureSessionPresetPhoto];
//    }
//    
//    //2.给Session添加input输入
//    NSError *error;
//    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
//    
//    self.isUsingFrontFacingCamera = NO;
//    
//    if ([session canAddInput:deviceInput]) {
//        [session addInput:deviceInput];
//    }
//    
//    //3.给session添加output输出
//    self.stillImageOutput = [AVCapturePhotoOutput new];
//    [self.stillImageOutput addObserver:self forKeyPath:@"capturingStillImage" options:NSKeyValueObservingOptionNew context:nil];
//    if ([session canAddOutput:self.stillImageOutput]) {
//        [session addOutput:self.stillImageOutput];
//    }
//    self.videoDataOutput  = [AVCaptureVideoDataOutput new];
//    NSDictionary *rgbOutputSettings = [NSDictionary dictionaryWithObjects:@[[NSNumber numberWithInt:kCMPixelFormat_32BGRA]] forKeys:@[(id)kCVPixelBufferPixelFormatTypeKey]];
//    [self.videoDataOutput setVideoSettings:rgbOutputSettings];
//    [self.videoDataOutput setAlwaysDiscardsLateVideoFrames:YES];
//    self.videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
//    [self.videoDataOutput setSampleBufferDelegate:self queue:self.videoDataOutputQueue];
//    if ([session canAddOutput:self.videoDataOutput]) {
//        [session addOutput:self.videoDataOutput];
//    }
//    [[self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:NO];
//    AVCaptureConnection *videoCon = [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo];
//    if ([videoCon isVideoOrientationSupported]) {
//        videoCon.videoOrientation = AVCaptureVideoOrientationPortrait;
//    }
//    
//    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
//    [self.previewLayer setBackgroundColor:WYHBLACK.CGColor];
//    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
//    CALayer *rootLayer = [self.previewLayer modelLayer];
//    [rootLayer setMasksToBounds:YES];
//    [self.previewLayer setFrame:[rootLayer bounds]];
//    [rootLayer addSublayer:self.previewLayer];
//     
//    
//    [session startRunning];
    return [[UIImage alloc]initWithCGImage:image.CGImage scale:1.0f orientation:UIImageOrientationUpMirrored];
}

@end
