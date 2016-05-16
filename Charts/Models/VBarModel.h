//
//  VBarModel.h
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBarModel : NSObject
@property (nonatomic,copy) NSString * titleString;
@property (nonatomic,assign)CGFloat percerntage;
@property (nonatomic,assign)BOOL isSelected;
@property (nonatomic,assign)CGFloat detailNumber;
@end
