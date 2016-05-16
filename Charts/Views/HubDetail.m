//
//  HubDetail.m
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HubDetail.h"
@interface HubDetail()
@property (nonatomic,strong)UILabel * headLabel;
@property (nonatomic,strong)UILabel * bottomLabel;
@end
@implementation HubDetail

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setHeadString:(NSString *)headString{
    _headString = headString;
    self.headLabel.text = headString;
}

- (void)setBottomString:(NSString *)bottomString{
    _bottomString = bottomString;
    self.bottomLabel.text = bottomString;
}

- (UILabel*)headLabel{
    if(!_headLabel){

    }
    return _headLabel;
}

- (UILabel*)bottomLabel{
    if(!_bottomLabel){

    }
    return _bottomLabel;
}

- (void)setUpUI{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];

}

@end
