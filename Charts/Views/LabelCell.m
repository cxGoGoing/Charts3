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
@property (nonatomic,strong)NSLayoutConstraint * widthConstraint;
@end
@implementation LabelCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        //self.contentView.backgroundColor = [UIColor colorWithRed:0.154 green:0.231 blue:1.000 alpha:0.2];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(didUnselectVBarItem)]) {
        [self.delegate didUnselectVBarItem];
    }
}

- (void)setTextString:(NSString*)textString
{
    _textString = textString;
    self.descLabel.text = textString;
    self.widthConstraint.constant = (textString.length+4)*10;
    [self setNeedsLayout];

}

- (void)setUpUI
{
    [self.detailButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.detailButton autoSetDimension:ALDimensionHeight toSize:30];

    [self.detailButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:60];
    self.widthConstraint = [self.detailButton autoSetDimension:ALDimensionWidth toSize:20];
    self.descLabel.frame = CGRectMake(-5, 50, 90, 20);
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
