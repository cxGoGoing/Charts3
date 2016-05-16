//
//  HubDetail.h
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBarModel.h"
@interface HubDetail : UIView
@property (nonatomic,copy) NSString * headString;
@property (nonatomic,copy) NSString * bottomString;
@property (nonatomic,strong)VBarModel * model;
+ (instancetype)hubDetail;
@end
