//
//  LabelCell.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "LabelCell.h"
#import <PureLayout.h>
@interface LabelCell ()
@property (nonatomic, strong) UILabel* descLabel;
@property (nonatomic, strong) UILabel* detailLabel;
@property (nonatomic,strong)NSLayoutConstraint * widthConstraint;
@end
@implementation LabelCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        self.contentView.backgroundColor = [UIColor colorWithRed:0.154 green:0.231 blue:1.000 alpha:0.2];
    }
    return self;
}

- (void)setTextString:(NSString*)textString
{
    _textString = textString;
    self.descLabel.text = textString;
    self.widthConstraint.constant = textString.length*20;
    [self setNeedsLayout];

}

- (void)setUpUI
{

    [self.detailLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.detailLabel autoSetDimension:ALDimensionHeight toSize:30];

    [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:50];
    self.widthConstraint = [self.detailLabel autoSetDimension:ALDimensionWidth toSize:20];
    //[self.descLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.descLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [self.descLabel autoPinEdge:ALEdgeTrailing toEdge:ALEdgeLeading ofView:self.detailLabel withOffset:0];
}

- (UILabel*)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.backgroundColor = [UIColor colorWithRed:0.163 green:1.000 blue:0.514 alpha:1.000];
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UILabel*)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descLabel];
        _descLabel.font = [UIFont systemFontOfSize:11];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        //_descLabel.transform = CGAffineTransformMakeRotation(-M_PI / 6);
        _descLabel.layer.affineTransform = CGAffineTransformMakeRotation(-M_PI / 6);
        ;
        //_descLabel.layer.anchorPoint = CGPointMake(0.5, 1);
    }
    return _descLabel;
}
@end
