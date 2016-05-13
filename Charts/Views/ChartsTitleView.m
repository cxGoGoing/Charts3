//
//  ChartsTitleView.m
//  Charts
//
//  Created by chengxun on 16/5/12.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsTitleView.h"
#import "ChartsSectionLabel.h"
#import "UIView+Extension.h"
#import <PureLayout.h>
@interface ChartsTitleView()
@property (nonatomic,strong)UILabel * sectionTitle;
@property (nonatomic,strong)ChartsSectionLabel * gatherLabel;/**<  汇总  */
@property (nonatomic,strong)ChartsSectionLabel * dimensionLabel;/**<  维度  */
@property (nonatomic,strong)ChartsSectionLabel * siftLabel;/**<  筛选  */
@end
@implementation ChartsTitleView
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.alwaysBounceVertical = NO;
        self.backgroundColor = [UIColor clearColor];
        [self setUpUI];
    }
    return self;
}

- (void)reloadData{

}


- (void)setUpUI{
    [self.sectionTitle autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.sectionTitle autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.gatherLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.gatherLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.sectionTitle withOffset:6];
    [self.dimensionLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.dimensionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.gatherLabel withOffset:3];
    [self.siftLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.dimensionLabel withOffset:3];
    [self.siftLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
}

#pragma mark getter and setter

- (UILabel*)sectionTitle{
    if(!_sectionTitle){
        _sectionTitle = [[UILabel alloc]init];
        _sectionTitle.font = [UIFont systemFontOfSize:16];
        _sectionTitle.textColor = [UIColor blackColor];
        _sectionTitle.text = @"本部门销售趋势";
        [self addSubview:_sectionTitle];
    }
    return _sectionTitle;
}

- (ChartsSectionLabel*)siftLabel{
    if(!_siftLabel){
        _siftLabel = [[ChartsSectionLabel alloc]init];
        _siftLabel.text = @"维度";
        [self addSubview:_siftLabel];
    }
    return _siftLabel;
}

- (ChartsSectionLabel*)dimensionLabel{
    if(!_dimensionLabel){
        _dimensionLabel = [[ChartsSectionLabel alloc]init];
        _dimensionLabel.text = @"维度";
        [self addSubview:_dimensionLabel];
    }
    return _dimensionLabel;
}

- (ChartsSectionLabel*)gatherLabel{
    if(!_gatherLabel){
        _gatherLabel = [[ChartsSectionLabel alloc]init];
        _gatherLabel.text = @"汇总项";
        [self addSubview:_gatherLabel];
    }
    return _gatherLabel;
}




@end
