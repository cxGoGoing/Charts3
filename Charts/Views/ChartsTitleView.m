//
//  ChartsTitleView.m
//  Charts
//
//  Created by chengxun on 16/5/12.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsTitleView.h"
#import "ChartsSectionLabel.h"
#import "ChartSectionDetailLabel.h"
#import "UIView+Extension.h"
#import <PureLayout.h>
@interface ChartsTitleView()
@property (nonatomic,strong)UILabel * sectionTitle;
@property (nonatomic,strong)ChartsSectionLabel * gatherLabel;/**<  汇总  */
@property (nonatomic,strong)ChartsSectionLabel * dimensionLabel;/**<  维度  */
@property (nonatomic,strong)ChartsSectionLabel * siftLabel;/**<  筛选  */
@property (nonatomic,strong)ChartSectionDetailLabel * gatherDetail;
@property (nonatomic,strong)ChartSectionDetailLabel * dimensionDetail;
@property (nonatomic,strong)ChartSectionDetailLabel * siftDetail;

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

- (void)setDataArray:(NSArray<NSString *> *)dataArray{
    NSAssert(dataArray.count>0, @"数组数量大于0");
    _dataArray = [dataArray copy];
    self.gatherDetail.text = dataArray.firstObject;
    self.dimensionDetail.text = dataArray[1];
    self.siftDetail.text = dataArray.lastObject;

    DDLogInfo(@"%.2f", calWidth(self.siftLabel.text));
}


static inline CGFloat calWidth(NSString*text){
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    dictionary[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    CGSize size = [text sizeWithAttributes:dictionary];
    return size.width+10;
}

- (void)didMoveToSuperview{
    
}

- (void)setUpUI{
    [self.sectionTitle autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.sectionTitle autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.gatherLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.gatherLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.sectionTitle withOffset:6];
    [self.gatherDetail autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.gatherLabel withOffset:10];
    [self.gatherDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.gatherLabel];

    [self.dimensionLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];
    [self.dimensionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.gatherLabel withOffset:3];

    [self.dimensionDetail autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.dimensionLabel withOffset:10];
    [self.dimensionDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.dimensionLabel];

    [self.siftLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.dimensionLabel withOffset:3];
    [self.siftLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading];

    [self.siftDetail autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:self.siftLabel withOffset:10];
    [self.siftDetail autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.siftLabel];

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

- (ChartSectionDetailLabel*)gatherDetail{
    if(!_gatherDetail){
        _gatherDetail = [[ChartSectionDetailLabel alloc]init];
        [self addSubview:_gatherDetail];
    }
    return _gatherDetail;
}
- (ChartSectionDetailLabel*)dimensionDetail{
    if(!_dimensionDetail){
        _dimensionDetail = [[ChartSectionDetailLabel alloc]init];
        [self addSubview:_dimensionDetail];
    }
    return _dimensionDetail;
}
- (ChartSectionDetailLabel*)siftDetail{
    if(!_siftDetail){
        _siftDetail = [[ChartSectionDetailLabel alloc]init];
        [self addSubview:_siftDetail];
    }
    return _siftDetail;
}

- (ChartsSectionLabel*)siftLabel{
    if(!_siftLabel){
        _siftLabel = [[ChartsSectionLabel alloc]init];
        _siftLabel.text = @"筛选";

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
