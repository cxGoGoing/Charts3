//
//  HBarBackGroundView.m
//  Charts
//
//  Created by chengxun on 16/6/30.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HBarBackGroundView.h"
static const CGFloat kDashLineWidth = 0.5;
static const CGFloat kLineWidth = 0.5;
static const NSUInteger kXLineCount = 5;
static const CGFloat kMarginX = 10;
static const CGFloat kMarginY = 30;
@implementation HBarBackGroundView
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self drawLineInRect:rect];
}

- (void)drawLineInRect:(CGRect)rect{
    UIBezierPath * beizerPath = [UIBezierPath bezierPath];
    [beizerPath moveToPoint:CGPointZero];
    [beizerPath addLineToPoint:CGPointMake(0, rect.size.height-kMarginY)];
    [beizerPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height-kMarginY)];
    beizerPath.lineWidth = kLineWidth;
    [beizerPath stroke];
}
@end
