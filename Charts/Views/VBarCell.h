//
//  LabelCell.h
//  Charts
//
//  Created by chengxun on 16/5/11.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartViewDelegate.h"
#import "VBarModel.h"
@interface VBarCell : UICollectionViewCell
@property (nonatomic,weak)id<ChartViewDelegate> delegate;
@property (nonatomic,strong)NSIndexPath * indexPath;
@property (nonatomic,strong)VBarModel * model;
@end
