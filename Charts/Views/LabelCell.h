//
//  LabelCell.h
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartViewDelegate.h"
@interface LabelCell : UICollectionViewCell
@property (nonatomic,copy) NSString * textString;
@property (nonatomic,weak)id<ChartViewDelegate> delegate;
@end
