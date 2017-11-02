//
//  WyhAudioToolboxViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/1.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAudioToolboxViewController.h"

#import "WyhAudioToolbox.h"
#import "WyhTableViewCell.h"
static NSString *modelCell = @"modelCell";
@interface WyhAudioToolboxViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation WyhAudioToolboxViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        WyhModel *model = WyhModel.new;
        model.type = ModelTypeString;
        model.textStr = @"AudioToolbox系统提示音框架\n可以将短声音注册到system sound服务上，被注册到system sound服务上的声音称之为 system sounds。它必须满足下面几个条件。\n(1).播放的时间不能超过30秒\n(2).数据必须是 PCM或者IMA4流格式\n(3).必须被打包成下面三个格式之一：Core Audio Format (.caf), Waveform audio (.wav), 或者 Audio Interchange File (.aiff)\n声音文件必须放到设备的本地文件夹下面。通过AudioServicesCreateSystemSoundID方法注册这个声音文件.";
        
        WyhModel *model1 = WyhModel.new;
        model1.type = ModelTypeString;
        model1.textStr = @"播放系统声音";
        
        WyhModel *model2 = WyhModel.new;
        model2.type = ModelTypeString;
        model2.textStr = @"播放系统声音";
        
        WyhModel *model3 = WyhModel.new;
        model3.type = ModelTypeString;
        model3.textStr = @"震动";
        
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
    self.wyhTitle.wyhtext(@"AudioToolbox") ;
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
        [WyhAudioToolbox playSystemSound];
    }else if (indexPath.row==2){
        [WyhAudioToolbox playMySonud];
    }else if (indexPath.row==3){
        [WyhAudioToolbox playDomi];
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
