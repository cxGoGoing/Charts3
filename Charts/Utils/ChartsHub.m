//
//  ChartsHub.m
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsHub.h"
#import "UIView+Extension.h"
#import "VBarModel.h"
#import "HubDetail.h"
@interface ChartsHub ()
@property (nonatomic, strong) UIButton* leftBtn; /**<  选择按钮  */
@property (nonatomic, strong) UIButton* rightBtn;
@property (nonatomic, strong) HubDetail* hubDetail; /**<  详情label  */
@end
static ChartsHub* _chartsHub = nil;
static const CGFloat kAmimationTime = 0.5;
static const CGFloat kHubWidth = 220;
static const CGFloat kHubHeight = 55;

@implementation ChartsHub
+ (ChartsHub*)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _chartsHub = [[self alloc]init];
    });
    return _chartsHub;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (UIButton*)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"l-arrow－b"] forState:UIControlStateNormal];
        _leftBtn.frame = CGRectMake(0, 0, 30, 55);
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
- (UIButton*)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"r-arrow-b"] forState:UIControlStateNormal];
        _rightBtn.frame = CGRectMake(31 + 316 / 2, 0, 30, 55);
        [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (void)leftBtnClick
{
    if ([self.delegate respondsToSelector:@selector(userClickedLeft)]) {
        [self.delegate userClickedLeft];
    }
}

- (void)rightBtnClick
{
    if ([self.delegate respondsToSelector:@selector(userClickedRight)]) {
        [self.delegate userClickedRight];
    }
}

- (HubDetail*)hubDetail
{
    if (!_hubDetail) {
        _hubDetail = [HubDetail hubDetail];
    }
    return _hubDetail;
}
/**  给定的起始位置,根据不同视图起始位置应该不同  */
- (void)setUpUI
{
    self.frame = CGRectMake(15 + 60, [UIScreen mainScreen].bounds.size.height / 2, kHubWidth, kHubHeight);
    [self addSubview:self.hubDetail];
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
}

- (void)setModel:(VBarModel*)model
{
    _model = model;
    self.hubDetail.model = model;
}

- (void)dismissInView
{
    if (!self.superview)
        return;
    self.isShow = NO;
    NSAssert(self.superview != nil, @"父视图不存在");
    [self removeFromSuperview];
}

#pragma mark 改变视图位置的方法
- (void)showAtAxisY:(CGFloat)axisY
{
    self.isShow = YES;
    [UIView animateWithDuration:kAmimationTime animations:^{
        self.y = axisY;
        [self layoutIfNeeded];
    }];
}

- (void)showAtAxisX:(CGFloat)axisX
{
    self.isShow = YES;
    [UIView animateWithDuration:kAmimationTime animations:^{
        self.x = axisX;
        [self layoutIfNeeded];
    }];
}

- (void)showAtPoint:(CGPoint)point{
    self.isShow = YES;
    [UIView animateWithDuration:kAmimationTime animations:^{
        self.origin = point;
        [self layoutIfNeeded];
    }];
}

@end
