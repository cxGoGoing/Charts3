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
@interface ChartsHub()
@property (nonatomic,strong)UIButton * leftBtn;/**<  选择按钮  */
@property (nonatomic,strong)UIButton * rightBtn;
@property (nonatomic,strong)UILabel * detailLabel;/**<  详情label  */
@end
static ChartsHub * _chartsHub = nil;
static const CGFloat kAmimationTime = 0.5;

@implementation ChartsHub
+ (ChartsHub*)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _chartsHub = [[self alloc]init];
    });
    return _chartsHub;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.bounds = CGRectMake(0, 0, 220, 60);
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.layer.cornerRadius = 10;
    }
    return self;
}

- (void)setUpUI{

}

- (void)setModel:(VBarModel *)model{
    _model = model;
}

- (void)dismissInView{
    if(!self.superview)return;
    NSAssert(self.superview != nil, @"父视图不存在");
    [self removeFromSuperview];
}

#pragma mark 改变视图位置的方法
- (void)showAtAxisY:(CGFloat)axisY{
    [UIView animateWithDuration:kAmimationTime animations:^{
        self.centerY = axisY;
        [self layoutIfNeeded];
    }];

}

- (void)showAtAxisX:(CGFloat)axisX{

}

- (void)showAtPoint:(CGPoint)point{

}

@end
