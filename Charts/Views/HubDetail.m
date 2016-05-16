//
//  HubDetail.m
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HubDetail.h"
#import <PureLayout.h>
@interface HubDetail ()
@property (nonatomic, strong) UILabel* headLabel;
@property (nonatomic, strong) UILabel* bottomLabel;
@end
@implementation HubDetail

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

+ (instancetype)hubDetail
{
    HubDetail* detail = [[HubDetail alloc] init];
    [detail setUpUI];
    return detail;
}

- (void)setHeadString:(NSString*)headString
{
    _headString = headString;
    self.headLabel.text = headString;
}

- (void)setBottomString:(NSString*)bottomString
{
    _bottomString = bottomString;
    self.bottomLabel.text = bottomString;
}

- (UILabel*)headLabel
{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc] init];
        _headLabel.textColor = [UIColor whiteColor];
        _headLabel.font = [UIFont boldSystemFontOfSize:15];
        [self addSubview:_headLabel];
    }
    return _headLabel;
}

- (UILabel*)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textColor = [UIColor whiteColor];
        _bottomLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_bottomLabel];
    }
    return _bottomLabel;
}
/**  默认的Frame  */
- (void)setUpUI
{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.85];
    self.frame = CGRectMake(30.5, 0, 158, 55);
    [self.headLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [self.headLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:-10];
    [self.bottomLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [self.bottomLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self withOffset:10];
}

@end
