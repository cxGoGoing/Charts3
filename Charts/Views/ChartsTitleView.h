//
//  ChartsTitleView.h
//  Charts
//
//  Created by chengxun on 16/5/12.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartsTitleView : UIScrollView
@property (nonatomic,strong)NSMutableArray <NSString*>* dataArray;
- (void)reloadData;
@end
