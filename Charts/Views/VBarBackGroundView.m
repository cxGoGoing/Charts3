//
//  VBarBackGroundView.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "VBarBackGroundView.h"
static const CGFloat kDashLineWidth = 0.5;
static const CGFloat kLineWidth = 0.5;
static const NSUInteger kXLineCount = 5;
static const CGFloat kMarginX = 10;
static const CGFloat kMarginY = 30;
@implementation VBarBackGroundView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{

    [self drawLineInRect:rect];
    [self drawDashLineInRect:rect];
    [self createXLablesInRect:rect];
}

- (void)drawDashLineInRect:(CGRect)rect{
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, kDashLineWidth);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGFloat lengths[] = {1,1};
    CGContextSetLineDash(context, 0, lengths,2);
    for (int i = 1; i<=kXLineCount; i++) {
        CGFloat xPoints = i*(rect.size.width-kMarginX)/kXLineCount;
        CGFloat yPoints = rect.size.height-kMarginY;
        CGContextMoveToPoint(context, xPoints,yPoints );
        CGContextAddLineToPoint(context, xPoints,0);
        CGContextStrokePath(context);
    }
}

- (void)drawLineInRect:(CGRect)rect{
    UIBezierPath * beizerPath = [UIBezierPath bezierPath];
    [beizerPath moveToPoint:CGPointZero];
    [beizerPath addLineToPoint:CGPointMake(0, rect.size.height-kMarginY)];
    [beizerPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height-kMarginY)];
    beizerPath.lineWidth = kLineWidth;
    [beizerPath stroke];
}

- (void)createXLablesInRect:(CGRect)rect{
    for (int i = 0; i<=kXLineCount; i++){
        UILabel * xLabel = [[UILabel alloc]init];
        xLabel.font = [UIFont systemFontOfSize:12];
        xLabel.textColor = [UIColor blackColor];
        xLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat width = 50;
        CGFloat height = 20;
        CGFloat x = i*(rect.size.width-kMarginX)/kXLineCount;
        CGFloat y = rect.size.height-height;
        xLabel.bounds = CGRectMake(0, 0, width, height);
        xLabel.center = CGPointMake(x, y);
        xLabel.text = [NSString stringWithFormat:@"%zi",i*20];
        [self addSubview:xLabel];
    }
}

@end
