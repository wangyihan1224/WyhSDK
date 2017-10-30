//
//  WyhModel.h
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum :NSInteger{
    
    ModelTypeString =1,
    ModelTypeImage ,
}ModelType;
@interface WyhModel : NSObject
/*!brief  类型 1.文字 2.图片. */
@property(nonatomic,assign)NSInteger type;
/*!brief  文字内容. */
@property(nonatomic,strong)NSString *textStr;
/*!brief  图片. */
@property(nonatomic,strong)UIImage *image;

@end
