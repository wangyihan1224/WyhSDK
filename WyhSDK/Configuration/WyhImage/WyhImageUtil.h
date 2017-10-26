//
//  WyhImageUtil.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/9/29.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface WyhImageUtil : NSObject<AVCaptureVideoDataOutputSampleBufferDelegate>

/*!
 @brief 前置摄像头镜像
 @discussion 前置摄像头拍照，照片设置镜像.

 @code
 
 @endcode
 
 */

+(UIImage *)wyhMirror:(UIImage *)image;
/*!brief  是否是前置摄像头. */
@property(nonatomic,assign)BOOL isUsingFrontFacingCamera;
/*!brief  图像输出. */
@property(nonatomic,strong)AVCapturePhotoOutput *stillImageOutput;
/*!brief  预览. */
@property(nonatomic,strong)AVCaptureVideoDataOutput *videoDataOutput;
/*!brief  输出队列. */
@property(nonatomic,strong)dispatch_queue_t videoDataOutputQueue;
/*!brief  视频预览层. */
@property(nonatomic,strong)AVCaptureVideoPreviewLayer *previewLayer;
@end
