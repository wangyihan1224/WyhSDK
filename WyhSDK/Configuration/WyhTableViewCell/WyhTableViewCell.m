//
//  WyhTableViewCell.m
//  WyhSDK
//
//  Created by 王乙涵 on 2017/10/27.
//  Copyright © 2017年 王乙涵. All rights reserved.
//

#import "WyhTableViewCell.h"


@interface WyhTableViewCell()

@property(nonatomic,strong)WyhUILabel * wyhLb;

@property(nonatomic,strong)UIImageView * wyhImageV;


@end
@implementation WyhTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setup];
    }
    return self;
}
-(void)setup{

    self.wyhLb = WyhUILabel.new;
    self.wyhImageV = UIImageView.new;
    
    [self.contentView wyh_addSubView:@[self.wyhLb,self.wyhImageV]];
    self.wyhLb.numberOfLines = 0;

}

-(void)setModel:(WyhModel *)model{
    _model = model;
    if (model.type==ModelTypeString) {
        self.wyhLb.wyhtext(model.textStr);
        self.wyhImageV.image = nil;
        CGRect rect = [WyhUtil getStringSize:model.textStr withFontSize:14 withMaxWidth:WYHSCREEMWIDTH-20];
        self.wyhLb.wyhh(rect.size.height);
        
    }else if(model.type==ModelTypeImage){
        self.wyhLb.wyhtext(@"");
        self.wyhImageV.image = model.image;
    }else{
        self.wyhImageV.image = nil;
        self.wyhLb.wyhtext(@"");
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.wyhLb.wyhFont(14).wyhTop(self.contentView, 10).wyhLeft(self.contentView, 0).wyhRight(self.contentView, 10).wyhBottom(self.contentView, 10);

    self.wyhImageV.wyhTop(self.contentView, 10).wyhLeft(self.contentView, 0).wyhRight(self.contentView, 0).wyhBottom(self.contentView, 10);
}
@end
