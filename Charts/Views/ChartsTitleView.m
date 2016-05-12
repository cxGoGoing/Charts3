//
//  ChartsTitleView.m
//  Charts
//
//  Created by chengxun on 16/5/12.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsTitleView.h"
#import "ChartsSectionLabel.h"
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

- (ChartsSectionLabel*)siftLabel{
    if(!_siftLabel){
        _siftLabel = [[ChartsSectionLabel alloc]init];
        _siftLabel.text = @"维度";
    }
    return _siftLabel;
}

- (ChartsSectionLabel*)dimensionLabel{
    if(!_dimensionLabel){
        _dimensionLabel = [[ChartsSectionLabel alloc]init];
        _dimensionLabel.text = @"维度";
    }
    return _dimensionLabel;
}

- (ChartsSectionLabel*)gatherLabel{
    if(!_gatherLabel){
        _gatherLabel = [[ChartsSectionLabel alloc]init];
        _gatherLabel.text = @"汇总项";
    }
    return _gatherLabel;
}


- (void)setUpUI{

}


@end
