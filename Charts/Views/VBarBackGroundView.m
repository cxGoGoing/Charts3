//
//  VBarBackGroundView.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "VBarBackGroundView.h"

@implementation VBarBackGroundView

- (void)drawRect:(CGRect)rect{
    UIBezierPath * beizerPath = [UIBezierPath bezierPath];
    [beizerPath moveToPoint:CGPointZero];
    [beizerPath addLineToPoint:CGPointMake(0, rect.size.height)];
    [beizerPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    beizerPath.lineWidth = 0.5;
    [beizerPath stroke];

    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGFloat lengths[] = {2,2};
    CGContextSetLineDash(context, 0, lengths,2);
    CGContextMoveToPoint(context, 30.0, rect.size.height);
    CGContextAddLineToPoint(context, 30.0,0);
    CGContextStrokePath(context);

    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 70.0, rect.size.height);
    CGContextAddLineToPoint(context, 70.0,0);
    CGContextStrokePath(context);
}

@end
