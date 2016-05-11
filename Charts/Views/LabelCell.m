//
//  LabelCell.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "LabelCell.h"
#import <PureLayout.h>
@interface LabelCell()
@property (nonatomic,strong)UILabel * descLabel;
@property (nonatomic,strong)UILabel * detailLabel;
@end
@implementation LabelCell
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUpUI];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setTextString:(NSString *)textString{
    _textString = textString;
    self.descLabel.text = textString;
}

- (void)setUpUI{
    [self.descLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];

    [self.detailLabel autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.descLabel withOffset:10];
    [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    [self.detailLabel autoSetDimension:ALDimensionWidth toSize:200];


}

- (UILabel*)detailLabel{
    if(!_detailLabel){
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UILabel*)descLabel{
    if(!_descLabel){
        _descLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_descLabel];
        _descLabel.font = [UIFont systemFontOfSize:11];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        _descLabel.transform = CGAffineTransformMakeRotation(-M_PI_4);
    }
    return _descLabel;
}
@end
