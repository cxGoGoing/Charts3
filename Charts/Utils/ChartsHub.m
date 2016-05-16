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
@interface ChartsHub()
@property (nonatomic,strong)UIButton * leftBtn;/**<  选择按钮  */
@property (nonatomic,strong)UIButton * rightBtn;
@property (nonatomic,strong)HubDetail * hubDetail;/**<  详情label  */
@end
static ChartsHub * _chartsHub = nil;
static const CGFloat kAmimationTime = 0.5;
static const CGFloat kHubWidth = 220;
static const CGFloat kHubHeight = 55;

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
        [self setUpUI];
    }
    return self;
}

- (UIButton*)leftBtn{
    if(!_leftBtn){

    }
    return _leftBtn;
}

- (HubDetail*)hubDetail{
    if(!_hubDetail){

    }
    return _hubDetail;
}

- (UIButton*)rightBtn{
    if(!_rightBtn){

    }
    return _rightBtn;
}



- (void)setUpUI{
    self.frame = CGRectMake(15+60,[UIScreen mainScreen].bounds.size.height/2, kHubWidth, kHubHeight);

    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
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
        self.y = axisY;
        [self layoutIfNeeded];
    }];

}

- (void)showAtAxisX:(CGFloat)axisX{

}

- (void)showAtPoint:(CGPoint)point{

}

@end
