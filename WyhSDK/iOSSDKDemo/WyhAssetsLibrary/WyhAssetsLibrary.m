//
//  WyhAssetsLibrary.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/1.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAssetsLibrary.h"
#import <AssetsLibrary/AssetsLibrary.h>
@implementation WyhAssetsLibrary
+(void)getAllPhotos{
    
    NSMutableArray *groups = [NSMutableArray new];
    ALAssetsLibrary *library = [ALAssetsLibrary new];
    // 遍历相册
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            //遍历相册还未结束
            // 设置过滤器
            [group setAssetsFilter:[ALAssetsFilter allPhotos]];
            if (group.numberOfAssets) {
                [groups addObject:group];
            }
        }else{
            // 遍历结束（当group为空的时候就意味着结束）
            if (groups.count) {
                // 如果相册个数不为零，则可以在此处开始遍历相册了
                [WyhAssetsLibrary enumerateAssets:groups];
            }else{
                
                NSLog(@"没有相册列表");
            }
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"遍历失败");
    }];
}
+(void)enumerateAssets:(NSArray *)arr{
    NSMutableArray * assets = [NSMutableArray new];
    for (ALAssetsGroup *group in arr) {
        // 遍历所有的相片
        [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result) {
                // 遍历未结束
                [assets addObject:result];
            }else{
                // result 为nil，遍历结束
            }
        }];
        
        // 遍历指定的相片
        NSInteger fromIndex = 0; // 从指定的index开始遍历
        NSInteger toIndex =0; // 指定最后一张遍历的index
        [group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:toIndex] options:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (index > toIndex) {
                // 已经遍历到指定的最后一张照片
                *stop = YES;//停止遍历
            }else{
                if (result) {
                    // 存储相片
                    [assets addObject:result];
                    [[WyhAssetsLibrary new] showPhotoWith:result];
                }else{
                    // 遍历结束
                    // 展示图片
                    [[WyhAssetsLibrary new] showPhotoWith:result];
                }
            }
        }];
    }
}
- (void)showPhotoWith:(ALAsset *)asset{
    // 获取ALAsset对应的ALAssetRepresentation
    ALAssetRepresentation * representation = [asset defaultRepresentation];
    NSLog(@"%@", representation.url); // 图片URL
    NSLog(@"%@", NSStringFromCGSize(representation.dimensions)); // 图片尺寸
     NSLog(@"%lld", representation.size); // 数据字节
    NSLog(@"%@", representation.UTI); // Uniform Type Identifier : 统一类型标识符（表示图片或视频的类型）
    NSLog(@"%@", representation.filename); // 在相册中的文件名
    NSLog(@"%@", representation.metadata); // 元数据（一些设备相关的信息，比如使用的相机
    NSLog(@"%lf", representation.scale); // 缩放比例
    NSLog(@"%ld", representation.orientation); // 方向
    /**
     fullScreenImage : 返回当前设备尺寸大小的图片，编辑后的图片
     fullResolutionImage ： 原图，没有编辑的图片
     */
    // 获取原图
    UIImage * image = [UIImage imageWithCGImage:[representation fullScreenImage] scale:1.0 orientation:UIImageOrientationDownMirrored];
    
    self.imageview.image = image;
}
+(void)showALAssetsGroupInfo:(ALAssetsGroup *)assetsGroup{
    // 是否可编辑,即相册是否可以通过代码添加相片
     BOOL editable = assetsGroup.editable;
    // 添加一个ALAsset到当前相册,前提editable = YES，
    [assetsGroup addAsset:nil];
    /**
     + (ALAssetsFilter *)allPhotos; // 获取Photo
     + (ALAssetsFilter *)allVideos; // 获取Video
     + (ALAssetsFilter *)allAssets; // 获取Photo还有video
     */
    
    // 设置过滤器
    [assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
    
    // 当前过滤器下的ALAsset数量
    NSInteger number = assetsGroup.numberOfAssets;
    
    /**
     NSString *const ALAssetsGroupPropertyName; // Group的名称
     NSString *const ALAssetsGroupPropertyType; // Group类型（ALAssetsGroupType）
     NSString *const ALAssetsGroupPropertyPersistentID;
     NSString *const ALAssetsGroupPropertyURL; // 唯一表示这个Group的URL，可以通过URL在资源库中获取对应的Group，用于唯一标识这个group
     */
    
 // 通过Property获取ALAssetsGroup对应的信息
    NSLog(@"%@", [assetsGroup valueForProperty:ALAssetsGroupPropertyName]);
    NSLog(@"%@", [assetsGroup valueForProperty:ALAssetsGroupPropertyType]);
    NSLog(@"%@", [assetsGroup valueForProperty:ALAssetsGroupPropertyPersistentID]);
     NSLog(@"%@", [assetsGroup valueForProperty:ALAssetsGroupPropertyURL]);
    // 获取相册封面
    [assetsGroup posterImage];
}
- (void)showALAssetInfoWith:(ALAsset *)asset {
    /**
     NSString *const ALAssetPropertyType;
     NSString *const ALAssetPropertyLocation;
     NSString *const ALAssetPropertyDuration;
     NSString *const ALAssetPropertyOrientation;
     NSString *const ALAssetPropertyDate;
     NSString *const ALAssetPropertyRepresentations;
     NSString *const ALAssetPropertyURLs;
     NSString *const ALAssetPropertyAssetURL;
     */
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyType]); // 这个type表示这个是photo还是video
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyLocation]); // 拍摄的地点
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyDuration]); // 视频的时长
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyOrientation]); // 照片的方向
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyDate]); // 照片的拍摄时间
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyRepresentations]);
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyURLs]); //
    NSLog(@"%@", [asset valueForProperty:ALAssetPropertyAssetURL]);
    
    [asset thumbnail]; // 返回缩略图
    [asset aspectRatioThumbnail]; // 等比例缩略图
    [asset representationForUTI:@"public.jpeg"]; // 通过统一类型标识获取ALAssetRepresentation
    
    // ALAsset 还具有更改ALAsset中的元数据能力
    // ALAsset 的实例方法能保存Photo、video到相册
}


@end
