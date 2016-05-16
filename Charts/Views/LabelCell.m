//
//  LabelCell.m
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "LabelCell.h"
#import <PureLayout.h>
#import "UIView+Extension.h"
@interface LabelCell ()
@property (nonatomic, strong) UILabel* descLabel;
@property (nonatomic, strong) UIButton* detailButton;
@property (nonatomic, strong) NSLayoutConstraint* widthConstraint;
@property (nonatomic, strong) CAShapeLayer* barLayer;
@property (nonatomic, strong) CABasicAnimation* barAnimation;
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

- (CABasicAnimation*)barAnimation
{
    if (!_barAnimation) {
        _barAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _barAnimation.duration = kAnimationTime;
        _barAnimation.fromValue = @0;
        _barAnimation.toValue = @1;
        _barAnimation.delegate = self;
        _barAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _barAnimation.removedOnCompletion = YES;
    }
    return _barAnimation;
}

- (void)setTextString:(NSString*)textString
{
    _textString = [textString copy];
    self.descLabel.text = textString;
    self.widthConstraint.constant = (textString.length + 4) * 10;
    self.barLayer.path = [self barLayerPathWith:(textString.length + 4) * 10].CGPath;
}

- (void)setUpUI
{
    self.contentView.backgroundColor = [UIColor colorWithRed:0.926 green:1.000 blue:0.026 alpha:0.3];
    self.descLabel.frame = CGRectMake(-5, 50, 90, 20);
    [self.detailButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.detailButton autoSetDimension:ALDimensionHeight toSize:30];

    [self.detailButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:60];
    self.widthConstraint = [self.detailButton autoSetDimension:ALDimensionWidth toSize:0];
    [self.contentView.layer addSublayer:self.barLayer];
    [self.barLayer addAnimation:self.barAnimation forKey:@"lineAnimation"];
}

- (UIButton*)detailButton
{
    if (!_detailButton) {
        _detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_detailButton setBackgroundColor:[UIColor clearColor]];
        [_detailButton addTarget:self action:@selector(didClickDetailButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_detailButton];
    }
    return _detailButton;
}

- (void)didClickDetailButton:(UIButton*)sender
{
    CGRect rect = [self convertRect:sender.frame toView:self.superview.superview];
    if ([self.delegate respondsToSelector:@selector(userClickedOnVBarIndexItem:inRect:)]) {
        [self.delegate userClickedOnVBarIndexItem:self.indexPath.section inRect:rect];
    }
    //DDLogDebug(@"%@", NSStringFromCGRect(rect));
}

- (CAShapeLayer*)barLayer
{
    if (!_barLayer) {
        _barLayer = [CAShapeLayer layer];
        _barLayer.strokeColor = [UIColor blueColor].CGColor;
        _barLayer.fillColor = [UIColor clearColor].CGColor;
        _barLayer.lineWidth = 30;
    }
    return _barLayer;
}

- (UIBezierPath*)barLayerPathWith:(CGFloat)length
{
    UIBezierPath* beizerPath = [UIBezierPath bezierPath];
    [beizerPath moveToPoint:CGPointMake(60, 25)];
    [beizerPath addLineToPoint:CGPointMake(length + 60, 25)];
    return beizerPath;
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
