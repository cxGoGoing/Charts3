//
//  ChartSectionDetailLabel.m
//  Charts
//
//  Created by chengxun on 16/5/13.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "ChartSectionDetailLabel.h"

@implementation ChartSectionDetailLabel

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.font = [UIFont systemFontOfSize:13];
        self.textColor = [UIColor blackColor];
        self.numberOfLines = 0;
    }
    return self;
}

@end
