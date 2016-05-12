//
//  ChartsTitleView.m
//  Charts
//
//  Created by chengxun on 16/5/12.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsTitleView.h"
@interface ChartsTitleView()
@property (nonatomic,strong)UILabel * sectionTitle;
@property (nonatomic,strong)UILabel * gatherLabel;/**<  汇总  */
@property (nonatomic,strong)UILabel * DimensionLabel;/**<  维度  */
@property (nonatomic,strong)UILabel * siftLabel;/**<  筛选  */
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


- (void)setUpUI{

}


@end
