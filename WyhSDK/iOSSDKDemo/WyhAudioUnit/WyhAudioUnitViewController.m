//
//  WyhAudioUnitViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/1.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAudioUnitViewController.h"


#import "WyhTableViewCell.h"
static NSString *modelCell = @"modelCell";
@interface WyhAudioUnitViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation WyhAudioUnitViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        WyhModel *model = WyhModel.new;
        model.type = ModelTypeString;
        model.textStr = @"AudioUnit音频处理框架\n提供了混音、均衡、格式转换、实时IO录制、回放、离线渲染、语音对讲(VoIP)等音频处理插件，它们都属于不同的AudioUnit，支持动态载入和使用。\nAudioUnit可以单独创建使用，但更多的是被组合使用在Audio Processing Graph容器中以达到多样的处理需要";
        
       
        
        [_dataArray addObjectsFromArray:@[model]];
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
    self.wyhTitle.wyhtext(@"AudioUnit") ;
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

    }else if (indexPath.row==2){
        
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
