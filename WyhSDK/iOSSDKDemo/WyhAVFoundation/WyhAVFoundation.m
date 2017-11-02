//
//  WyhAVFoundation.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/2.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAVFoundation.h"
#import <AVFoundation/AVFoundation.h>

@implementation WyhAVFoundation
+(void)thumbnailImageRequest:(CGFloat)timeBySecond{
    //创建url
    NSURL *url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    //根据url创建AVURLAsset
    AVURLAsset *urlAsset = [AVURLAsset assetWithURL:url];
    //根据AVURLAsset创建AVAssetImageGenetator
    AVAssetImageGenerator *imageGenetator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    /*截图
     *requestTime:缩略图创建时间
     *actulTime:缩略图实际生成的时间
     */
    NSError *error = nil;
    //CMTime 是表示电影时间信息的结构体，第一个参数表示是视频第几秒，第二个参数表示每秒帧数。
    CMTime time = CMTimeMakeWithSeconds(timeBySecond, 10);
    CMTime actualTime;
    CGImageRef cgImage = [imageGenetator copyCGImageAtTime:time actualTime:&actualTime error:&error];
    if (error) {
        NSLog(@"截取视频缩略图时发生错误，错误信息：%@",error.localizedDescription);
        return;
    }
    CMTimeShow(actualTime);
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    CGImageRelease(cgImage);
}

+(void)playVc:(UIViewController *)vc{
    
    NSURL *url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    
    //创建播放器层
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectMake(0, 0, WYHSCREEMWIDTH, WYHSCREEMHEIGHT);
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;//视频填充模式
    [vc.view.layer addSublayer:playerLayer];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playbackFinished) name:AVPlayerItemDidPlayToEndTimeNotification object:player.currentItem];
    [player play];
    
}
//给播放器添加进度更新
-(void)addProgressObserver{
    NSURL *url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    
    UIProgressView *progress = [UIProgressView new];
    //这里设置每秒执行一次
    [player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current = CMTimeGetSeconds(time);
        float total = CMTimeGetSeconds([item duration]);
        NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
            [progress setProgress:(current/total) animated:YES];
        }
    }];
}

//给AVPlayerItem添加监控
-(void)addObserverToPlayerItem:(AVPlayerItem *)playerItem{
    //监控状态属性，注意AVPlayer也有一个status属性，通过监控它的status也可以获得播放状态
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //监控网络加载情况属性
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
}
-(void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:@"status"];
     [playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    AVPlayerItem *playerItem = object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status = [[change objectForKey:@"new"] intValue];
        if (status == AVPlayerStatusReadyToPlay) {
            NSLog(@"正在播放。。。视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
        }
        
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array = playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds +durationSeconds;//缓冲总长度
        NSLog(@"共缓冲： %.2f",totalBuffer);
    }
}

+(void)diyCamere{
//    1.创建session(捕捉会话)
    AVCaptureSession *captureSession = [AVCaptureSession new];
    [captureSession setSessionPreset:AVCaptureSessionPresetPhoto];
    
    
//    2.创建device input(捕捉设备输入)
    //该方法会返回当前能够输入视频的全部设备，包括前后摄像头和外接设备
//    NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    //该方法会返回当前能够输入音频的全部设备
//    NSArray *audioDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio];
    // 获取视频输入设备，该方法默认返回iPhone的后置摄像头
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    // 将捕捉设备加入到捕捉会话中
    AVCaptureDeviceInput *viedeInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (viedeInput) {
        if ([captureSession canAddInput:viedeInput]) {
            [captureSession addInput:viedeInput];
        }
    }
    //音频输入
    AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    AVCaptureDeviceInput *audioIn = [[AVCaptureDeviceInput alloc]initWithDevice:audioDevice error:&error];
    if ([captureSession canAddInput:audioIn]) {
        [captureSession addInput:audioIn];
    }
    
//    3.预览view
    // 创建一个previewLayer
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer new];
    previewLayer.frame = CGRectMake(0, 0, WYHSCREEMWIDTH, WYHSCREEMHEIGHT);
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
    [previewLayer setSession:captureSession];
    
//    //创建glview
//    EAGLContext *context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
//    GLKView *glView = [[GLKView alloc]initWithFrame:self.view.bounds context:context];
//    [EAGLContext setCurrentContext:context];
//    [self.view addSubview:glView];
//    glView.transform = CGAffineTransformMakeRotation(M_PI_2);
//    glView.frame = [UIApplication sharedApplication].keyWindow.bounds;

//    4.创建capture output(捕捉的输出)
    AVCaptureAudioDataOutput *videoOutput = [[AVCaptureAudioDataOutput alloc]init];
   AVCaptureConnection *videoConnnection =  [videoOutput connectionWithMediaType:AVMediaTypeVideo];
//    videoConnnection.videoOrientation =  self.referenceOrientation;
//    f (connection == _videoConnection){
//        if ([self inputsReadyToRecord]){
//            [self writeSampleBuffer:sampleBuffer ofType:AVMediaTypeVideo];
//        }
//    }
//
//    // 设置音频捕捉连接
//    _audioConnection = [audioOut connectionWithMediaType:AVMediaTypeAudio];
//    // 在视频元数据的输出函数中，如果捕捉连接是音频连接，则写入音频数据
//    if (connection == _audioConnection){
//        if (_readyToRecordVideo && _readyToRecordAudio){
//            [self writeSampleBuffer:sampleBuffer ofType:AVMediaTypeAudio];
//        }
//    }

//    5.拍照、录视频(元数据转成图片或文件)
    //创建image output 代码
    AVCaptureStillImageOutput *imageOutput = [[AVCaptureStillImageOutput alloc] init];
    imageOutput.outputSettings = @{AVVideoCodecKey : AVVideoCodecJPEG};
    if ([captureSession canAddOutput:imageOutput]) {
        [captureSession addOutput:imageOutput];
    }
    // 输出图片
    AVCaptureConnection *connection = [imageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (connection.isVideoOrientationSupported) {
//        connection.videoOrientation = [self currentVideoOrientation];
    }
    id takePictureSuccess = ^(CMSampleBufferRef smapleBuffer,NSError *error){
        if (smapleBuffer == NULL) {
//            [self showError:error];
            return ;
        }
        NSData *imagData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:smapleBuffer];
        UIImage *image = [[UIImage alloc]initWithData:imagData];
        
    };
    [imageOutput captureStillImageAsynchronouslyFromConnection:connection completionHandler:takePictureSuccess];
    
    //// 音频输出
    AVCaptureAudioDataOutput *audioOut = [[AVCaptureAudioDataOutput alloc] init];
//    [audioOut setSampleBufferDelegate:self queue:captureQueue];
//    if ([_captureSession canAddOutput:audioOut]){
//        [_captureSession addOutput:audioOut];
//    }
    // 视频输出
    AVCaptureVideoDataOutput *videoOut = [[AVCaptureVideoDataOutput alloc] init];
//    videoOut setAlwaysDiscardsLateVideoFrames:YES];
//    [videoOut setVideoSettings:@{(id)kCVPixelBufferPixelFormatTypeKey : [NSNumber numberWithInt:kCVPixelFormatType_32BGRA]}];
//    [videoOut setSampleBufferDelegate:self queue:captureQueue];
//    if ([_captureSession canAddOutput:videoOut]){
//        [_captureSession addOutput:videoOut];
//        _videoOutput = videoOut;
//    }
  
}
// 将屏幕坐标系的点转换为previewLayer坐标系的点
//- (CGPoint)captureDevicePointForPoint:(CGPoint)point {
//    return [previewLayer.layer captureDevicePointOfInterestForPoint:point];
//}
// 在视频输出函数中绘制出来
//-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection{
//    if (_glview.context != [EAGLContext currentContext]) {
//        [EAGLContext setCurrentContext:_glview.context];
//    }
//    CVImageBufferRef imageRef = CMSampleBufferGetImageBuffer(sampleBuffer);
//    CIImage *image = [CIImage imageWithCVImageBuffer:imageRef];
//    [_glview bindDrawable];
//    [_cicontext drawImage:image inRect:image.extent fromRect:image.extent];
//    [_glview display];
//}


//-(void)playbackFinished{
//    NSLog(@"播放结束");
//}
@end
