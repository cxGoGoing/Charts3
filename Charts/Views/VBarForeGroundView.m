//
//  VBarForeGroundView.m
//  Charts
//
//  Created by chengxun on 16/5/18.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "VBarForeGroundView.h"

@implementation VBarForeGroundView
+ (instancetype)foreGroundViewWithFrame:(CGRect)frame itemSize:(CGFloat)itemSize
{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    VBarForeGroundView* foreGroundView = [[VBarForeGroundView alloc] initWithFrame:frame collectionViewLayout:layout];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - itemSize, itemSize);
    foreGroundView.backgroundColor = [UIColor clearColor];
    foreGroundView.showsVerticalScrollIndicator = NO;
    foreGroundView.alwaysBounceVertical = YES;
    foreGroundView.contentInset = UIEdgeInsetsMake(0, 0, 22, 0);
    return foreGroundView;
}

@end
