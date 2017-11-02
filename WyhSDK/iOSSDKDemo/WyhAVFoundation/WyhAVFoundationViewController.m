//
//  WyhAVFoundationViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/2.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAVFoundationViewController.h"

#import "WyhAVFoundation.h"
#import "WyhTableViewCell.h"
static NSString *modelCell = @"modelCell";
@interface WyhAVFoundationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation WyhAVFoundationViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        WyhModel *model = WyhModel.new;
        model.type = ModelTypeString;
        model.textStr = @"AVFoundation视听媒体的框架\n可以用来使用和创建基于时间的视听媒体的框架，它提供了一个能使用基于时间的视听数据的详细级别的Objective-C接口。在使用时，应尽量使用最高级别的抽象的控件：\n1.如果只是想播放视频，应该使用AVKit框架。\n2.在IOS中，如果只是想录制视频，可以使用UIKit框架（UIImagePickerController）.\n但是，值得注意的是，一些用在AV Foundation-including的基于时间数据结构的原始数据结构和带有未公开的媒体数据描述的部分是声明在Core Media框架的。";
        
        WyhModel *model1 = WyhModel.new;
        model1.type = ModelTypeString;
        model1.textStr = @"截取视频图像";
        
        WyhModel *model2 = WyhModel.new;
        model2.type = ModelTypeString;
        model2.textStr = @"播放视频";
        
        WyhModel *model3 = WyhModel.new;
        model3.type = ModelTypeString;
        model3.textStr = @"自定义相机";
        
        [_dataArray addObjectsFromArray:@[model,model1,model2,model3]];
    }
    return _dataArray;
}
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_table registerClass:[WyhTableViewCell class] forCellReuseIdentifier:modelCell];
    }
    return _table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wyhTitle.wyhtext(@"AVFoundation") ;
    self.wyhBackBt.hidden = NO;
    
    [self.view wyh_addSubView:@[self.table]];
    
    self.table.wyhTop(self.wyhNavi, 1).wyhLeft(self.view, 0).wyhRight(self.view, 0).wyhBottom(self.view, 0);
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WyhTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:modelCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.dataArray.count>0) {
        cell.model = self.dataArray[indexPath.row];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count>0) {
        WyhModel * model = self.dataArray[indexPath.row];
        if (model.type == ModelTypeString) {
            
            CGRect rect = [WyhUtil getStringSize:model.textStr withFontSize:14 withMaxWidth:WYHSCREEMWIDTH-20];
            return rect.size.height+20;
            
        }
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = nil;
    if (indexPath.row==1) {
        [WyhAVFoundation thumbnailImageRequest:4];
    }else if (indexPath.row==2){
        [WyhAVFoundation playVc:self];
    }else if (indexPath.row==3){
       
    }
    if (vc) {
        [self wyhPush:vc];
    }else{
        
    }
    
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
