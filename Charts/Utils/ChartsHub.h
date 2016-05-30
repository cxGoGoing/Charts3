//
//  ChartsHub.h
//  Charts
//
//  Created by chengxun on 16/5/16.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ChartsHubLocation) {
    ChartsHubLocationVertical,
    ChartsHubLocationHorizonal,
    ChartsHubLocationCircle,
    ChartsHubLocationLine,
    ChartsHubLocationPointer
};
@class VBarModel;
@protocol ChartsHubDelegate <NSObject>
@optional
- (void)userClickedCenter;
- (void)userClickedLeft;
- (void)userClickedRight;
@end
@interface ChartsHub : UIView
+ (ChartsHub*)shareInstance;
- (void)showAtAxisY:(CGFloat)axisY;
- (void)showAtAxisX:(CGFloat)axisX;
- (void)showAtPoint:(CGPoint)point;
- (void)dismissInView;
@property (nonatomic, strong) VBarModel* model;
@property (nonatomic, weak) id<ChartsHubDelegate> delegate;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger maxIndex;
@property (nonatomic, assign) BOOL isShow;
@end
