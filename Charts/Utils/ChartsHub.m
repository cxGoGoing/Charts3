//
//  ChartsHub.m
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsHub.h"
#import "UIView+Extension.h"
@interface ChartsHub()
@end
static ChartsHub * _chartsHub = nil;

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
        self.bounds = CGRectMake(0, 0, 220, 50);
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 300);
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)dismissInView{
    NSAssert(self.superview!=nil, @"父视图存在");
    [self removeFromSuperview];
}

- (void)showAtAxisY:(CGFloat)axisY{
    self.centerY = axisY;
}

@end
