//
//  LabelCell.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "LabelCell.h"
#import <PureLayout.h>
#import <BlocksKit+UIKit.h>
#import "UIView+Extension.h"
@interface LabelCell ()
@property (nonatomic, strong) UILabel* descLabel;
@property (nonatomic, strong) UIButton* detailButton;
@property (nonatomic, strong) NSLayoutConstraint* widthConstraint;
@property (nonatomic, strong) CAShapeLayer* barLayer;
@end
@implementation LabelCell
static const CGFloat kAnimationTime = 0.5;
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    if ([self.delegate respondsToSelector:@selector(didUnselectVBarItem)]) {
        [self.delegate didUnselectVBarItem];
    }
}

- (void)addAnimation{

    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = kAnimationTime;
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    [self.barLayer addAnimation:animation forKey:@"circleAnimation"];
}



- (void)setTextString:(NSString*)textString
{
    _textString = textString;
    self.descLabel.text = textString;
//    self.barLayer = [self newBarLayerWithLength:(textString.length + 4) * 10 borderWidth:30 fillColor:[UIColor clearColor] borderColor:[UIColor greenColor]];
//    [self.contentView.layer addSublayer:self.barLayer];
//    [self addAnimation];
    self.widthConstraint.constant = (textString.length+4)*10;


    //[self setNeedsLayout];
}

- (void)setUpUI
{
    self.descLabel.frame = CGRectMake(-5, 50, 90, 20);
    [self.detailButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.detailButton autoSetDimension:ALDimensionHeight toSize:30];

    [self.detailButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:60];
    self.widthConstraint = [self.detailButton autoSetDimension:ALDimensionWidth toSize:0];
}

- (UIButton*)detailButton{
    if(!_detailButton){
        _detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_detailButton setBackgroundColor:[UIColor blueColor]];
        [_detailButton bk_addEventHandler:^(UIButton * sender) {
            CGRect rect =  [self convertRect:sender.frame toView:self.superview];
            if([self.delegate respondsToSelector:@selector(userClickedOnVBarIndexItem:)]){
                [self.delegate userClickedOnVBarIndexItem:self.indexPath.section];
            }
            DDLogDebug(@"%@",NSStringFromCGRect(rect));
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_detailButton];
    }
    return _detailButton;
}

- (CAShapeLayer*)newBarLayerWithLength:(CGFloat)length borderWidth:(CGFloat)borderWidth fillColor:(UIColor*)fillColor borderColor:(UIColor*)borderColor
{
    CAShapeLayer* line = [CAShapeLayer layer];
    UIBezierPath * beizerPath = [UIBezierPath bezierPath];
    [beizerPath moveToPoint:CGPointMake(60, 25)];
    [beizerPath addLineToPoint:CGPointMake(length+60, 25)];
    line.strokeColor = borderColor.CGColor;
    line.fillColor = fillColor.CGColor;
    line.lineWidth = borderWidth;
    line.path = beizerPath.CGPath;
    return line;
}

- (UILabel*)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descLabel];
        _descLabel.font = [UIFont systemFontOfSize:10];
        _descLabel.textAlignment = NSTextAlignmentRight;
        _descLabel.layer.affineTransform = CGAffineTransformMakeRotation(-M_PI / 6);
        ;
        _descLabel.layer.anchorPoint = CGPointMake(0.5, 1);
    }
    return _descLabel;
}
@end
