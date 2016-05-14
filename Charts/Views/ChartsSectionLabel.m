//
//  ChartsSectionLabel.m
//  Charts
//
//  Created by chengxun on 16/5/12.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartsSectionLabel.h"

@implementation ChartsSectionLabel
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.textColor = [UIColor grayColor];
        self.font  = [UIFont systemFontOfSize:13];
    }
    return self;
}

@end
