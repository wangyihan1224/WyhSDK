//
//  WyhAssetsLibraryViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/11/1.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhAssetsLibraryViewController.h"

#import "WyhAssetsLibrary.h"
#import "WyhTableViewCell.h"
static NSString *modelCell = @"modelCell";
@interface WyhAssetsLibraryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation WyhAssetsLibraryViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        WyhModel *model = WyhModel.new;
        model.type = ModelTypeString;
        model.textStr = @"AssetsLibrary手机相册框架\n获取手机相册里面的图片或者视频";
        
        WyhModel *model1 = WyhModel.new;
        model1.type = ModelTypeString;
        model1.textStr = @"查看相册";
        
        
        
        [_dataArray addObjectsFromArray:@[model,model1]];
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
    self.wyhTitle.wyhtext(@"AssetsLibrary") ;
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
        WyhAssetsLibrary *ass =  [WyhAssetsLibrary new];
        ass.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
        [self.view addSubview:ass.imageview];
        
        [WyhAssetsLibrary getAllPhotos];
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
