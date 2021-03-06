//
//  WyhvImageViewController.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/30.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhvImageViewController.h"

#import "WyhAccelerate.h"
#import "WyhTableViewCell.h"
static NSString *cellid = @"cellid";
@interface WyhvImageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;//
@property(nonatomic,strong)NSMutableArray *dataArray;//
@end

@implementation WyhvImageViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        WyhModel *model = WyhModel.new;
        model.type = ModelTypeString;
        model.textStr = @"iOS毛玻璃效果";
        
        WyhModel *model1 = WyhModel.new;
        model1.type = ModelTypeImage;
        model1.image = [UIImage imageNamed:@"2"];
        
        WyhModel *model2 = WyhModel.new;
        model2.type = ModelTypeImage;
        model2.image = [WyhAccelerate boxblurImage:model1.image withBlurNumber:0.5];
        
        [_dataArray addObjectsFromArray:@[model,model1,model2]];
    }
    return _dataArray;
}
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_table registerClass:[WyhTableViewCell class] forCellReuseIdentifier:cellid];
    }
    return _table;
}
//右侧按钮点击事件
-(void)rightButtonAction{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.wyhTitle.wyhtext(@"vImage") ;
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
    WyhTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
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
            
        }else if (model.type==ModelTypeImage){
            
            return 300;
        }
    }
    return 0;
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
