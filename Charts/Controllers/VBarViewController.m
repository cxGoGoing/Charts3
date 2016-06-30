//
//  HomeViewController.m
//  Charts
//
//  Created by chengxun on 16/5/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "VBarViewController.h"
#import "VBarCell.h"
#import "VBarBackGroundView.h"
#import "ChartsTitleView.h"
#import "ChartsHub.h"
#import "UIView+Extension.h"
#import "VBarModel.h"
#import "VBarForeGroundView.h"
#import <MJExtension.h>
@interface VBarViewController () <UICollectionViewDelegate, UICollectionViewDataSource, ChartViewDelegate, ChartsHubDelegate>
@property (nonatomic, strong) VBarForeGroundView* collectionView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) VBarBackGroundView* backGroundView;
@property (nonatomic, strong) ChartsTitleView* titleView; /**<  滚动视图  */
@property (nonatomic, strong) UIButton* siftBtn;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) BOOL previousState; /**< 弹出框之前的状态  */
@end

static const CGFloat kBottomHeight = 60; /**<  筛选按钮高度  */
static const CGFloat kMarginY = 30; /**<  collectionView的高度和底部backView的Y方向高度差  */
static const CGFloat kMarginBottom = 30; /**<  colleciontView和底部bottom的距离  */
static const CGFloat kHubHeight = 55;
static const CGFloat kItemSize = 40;
@implementation VBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];

    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self hideHub];
}

static inline CGSize calTextSize(NSString* text, NSInteger font)
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    dictionary[NSFontAttributeName] = [UIFont systemFontOfSize:font];
    CGSize size = [text sizeWithAttributes:dictionary];
    return size;
}
static inline CGFloat calBackViewHeight()
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height - 20 - 154 / 2 - 30 - kBottomHeight - 10 - kMarginBottom - 30;
    return height;
}
#pragma mark getter and setter
- (ChartsTitleView*)titleView
{
    if (!_titleView) {
        _titleView = [[ChartsTitleView alloc] initWithFrame:CGRectMake(15, 20 + 64, [UIScreen mainScreen].bounds.size.width - 30, 154 / 2)];
        _titleView.dataArray = @[ @"销售额总和", @"客户名", @"筛选条件1,筛选条件2,筛选条件3,筛选条件4,筛选条件5,筛选条件6,筛选条件7,筛选条件8,筛选条件9,筛选条件10" ];
        _titleView.contentSize = CGSizeMake(calTextSize(_titleView.dataArray.lastObject, 13).width + 36, 0);
    }
    return _titleView;
}

- (VBarBackGroundView*)backGroundView
{
    if (!_backGroundView) {

        _backGroundView = [[VBarBackGroundView alloc] initWithFrame:CGRectMake(80, 131 + 64, [UIScreen mainScreen].bounds.size.width - 15 - 85, calBackViewHeight())];
        _backGroundView.backgroundColor = [UIColor clearColor];
        _backGroundView.userInteractionEnabled = NO;
    }
    return _backGroundView;
}

- (UIButton*)siftBtn
{
    if (!_siftBtn) {
        _siftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_siftBtn setImage:[UIImage imageNamed:@"筛选icon"] forState:UIControlStateNormal];
        [_siftBtn setTitle:@"筛选" forState:UIControlStateNormal];
        _siftBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_siftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _siftBtn.titleEdgeInsets = UIEdgeInsetsMake(50, -32, 0, 0);
        [_siftBtn addTarget:self action:@selector(siftData:) forControlEvents:UIControlEventTouchUpInside];
        _siftBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, [UIScreen mainScreen].bounds.size.height - 70, 32, kBottomHeight);
    }
    return _siftBtn;
}

- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray* array = @[ @{ @"titleString" : @"北首开知语城",
            @"detailNumber" : @"1" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"2" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"5" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"6" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"9" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"2.5" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"3.6" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"4.7" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"6.2" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"1.1" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"6.1" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"3.2" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"1" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"4" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"7" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"2" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"1.5" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"2" },
            @{ @"titleString" : @"北首开知语城",
                @"detailNumber" : @"8.8" } ];
        _dataArray = [VBarModel objectArrayWithKeyValuesArray:array];
    }
    return _dataArray;
}

- (VBarForeGroundView*)collectionView
{
    if (!_collectionView) {
        _collectionView = [VBarForeGroundView foreGroundViewWithFrame:CGRectMake(15, 131 + 64, [UIScreen mainScreen].bounds.size.width - 30, calBackViewHeight() - kMarginY) itemSize:kItemSize];
        [_collectionView registerClass:[VBarCell class] forCellWithReuseIdentifier:NSStringFromClass([VBarCell class])];
        _collectionView.dataSource = self;
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideHub)];
        [_collectionView addGestureRecognizer:tapGesture];
    }
    return _collectionView;
}

#pragma mark private method
- (void)siftData:(UIButton*)btn
{
    [self hideHub];
    [_siftBtn setImage:[UIImage imageNamed:@"取消选择icon"] forState:UIControlStateNormal];
    [_siftBtn setTitle:@"取消选择" forState:UIControlStateNormal];
    CATransition* transition = [CATransition animation];
    transition.type = @"cube";
    transition.duration = 0.5;
    [_siftBtn.layer addAnimation:transition forKey:@"cubeAnimation"];
    self.titleView.dataArray = @[ @"销售总和", @"客户名", @"筛选条件" ];
    [self.dataArray removeAllObjects];
    self.dataArray = [VBarModel objectArrayWithKeyValuesArray:@[ @{ @"titleString" : @"魅族科技棒棒哒",
        @"detailNumber" : @"1" },
        @{ @"titleString" : @"小米科技棒",
            @"detailNumber" : @"2" },
        @{ @"titleString" : @"360棒棒哒",
            @"detailNumber" : @"7.9" },
        @{ @"titleString" : @"通过前几篇",
            @"detailNumber" : @"5" },
        @{ @"titleString" : @"UIView层",
            @"detailNumber" : @"9.1" },
        @{ @"titleString" : @"2015-1",
            @"detailNumber" : @"11" },
        @{ @"titleString" : @"2015-2",
            @"detailNumber" : @"12" },
        @{ @"titleString" : @"2015-3",
            @"detailNumber" : @"8.6" },
        @{ @"titleString" : @"2015-4",
            @"detailNumber" : @"4.3" },
        @{ @"titleString" : @"2015-5",
            @"detailNumber" : @"11.6" },
        @{ @"titleString" : @"2015-6",
            @"detailNumber" : @"9.6" },
        @{ @"titleString" : @"2015-7",
            @"detailNumber" : @"4.6" },
        @{ @"titleString" : @"2015-8",
            @"detailNumber" : @"1.6" } ]];
    [self.collectionView reloadData];
    _titleView.contentSize = CGSizeMake(calTextSize(self.titleView.dataArray.lastObject, 13).width + 36, 0);
}

- (void)setUpUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backGroundView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.siftBtn];
}
#pragma mark ChartsDelegate方法
- (void)userClickedOnVBarIndexItem:(NSInteger)vBarIndex inRect:(CGRect)rect
{
    self.previousState = [ChartsHub shareInstance].isShow;
    CGFloat startY = CGRectGetMinY(rect);
    CGFloat positionY = startY - kHubHeight - 5;
    if (startY - kHubHeight - 5 < CGRectGetMinY(self.collectionView.frame)) { /**  当前视图放不下的情况下从上往下放  */
        positionY = startY + kItemSize - 5;
    }
    [self.dataArray enumerateObjectsUsingBlock:^(VBarModel* model, NSUInteger idx, BOOL* _Nonnull stop) {
        if(idx == vBarIndex){
            model.isSelected = NO;
        }else{
            model.isSelected = YES;
        }
    }];
    [ChartsHub shareInstance].model = self.dataArray[vBarIndex];
    [[ChartsHub shareInstance] showAtAxisY:positionY];
    [ChartsHub shareInstance].delegate = self;
    [self.view addSubview:[ChartsHub shareInstance]];
    if ([ChartsHub shareInstance].isShow && self.previousState) {
        if (vBarIndex == self.currentIndex) {
            [self hideHub];
            return;
        }
        else {
            [self.collectionView reloadItemsAtIndexPaths:@[ [NSIndexPath indexPathForItem:0 inSection:vBarIndex], [NSIndexPath indexPathForItem:0 inSection:self.currentIndex] ]];
        }
    }
    else {
        [self.collectionView reloadData];
    }
    [ChartsHub shareInstance].isShow = YES;
    self.currentIndex = vBarIndex;
}

/**  浮起框点击右侧的结果  */
- (void)userClickedRight
{
    NSInteger index = self.currentIndex + 1;
    if (self.currentIndex == self.dataArray.count - 1) {
        index = 0;
    }
    [self.dataArray enumerateObjectsUsingBlock:^(VBarModel* model, NSUInteger idx, BOOL* _Nonnull stop) {
        if(idx == index){
            model.isSelected = NO;
        }else if(idx == self.currentIndex){
            model.isSelected = YES;
        }
    }];
    [ChartsHub shareInstance].model = self.dataArray[index];
    [self.collectionView reloadItemsAtIndexPaths:@[ [NSIndexPath indexPathForItem:0 inSection:index], [NSIndexPath indexPathForItem:0 inSection:self.currentIndex] ]];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    self.currentIndex = index;
}
/**  浮起框点击左侧的结果  */
- (void)userClickedLeft
{

    NSInteger index = self.currentIndex - 1;
    if (self.currentIndex == 0) {
        index = self.dataArray.count - 1;
    }
    [self.dataArray enumerateObjectsUsingBlock:^(VBarModel* model, NSUInteger idx, BOOL* _Nonnull stop) {
        if(idx == index){
            model.isSelected = NO;
        }else if(idx == self.currentIndex){
            model.isSelected = YES;
        }
    }];
    [ChartsHub shareInstance].model = self.dataArray[index];
    [self.collectionView reloadItemsAtIndexPaths:@[ [NSIndexPath indexPathForItem:0 inSection:index], [NSIndexPath indexPathForItem:0 inSection:self.currentIndex] ]];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    //DDLogWarn(@"------%zi", index);
    self.currentIndex = index;
}
- (void)userClickedCenter
{
}

/**  隐藏hub  */
- (void)hideHub
{
    [[ChartsHub shareInstance] dismissInView];
    DDLogInfo(@"hideHub%@", [ChartsHub shareInstance].isShow ? @"Yes" : @"NO");
    [self.dataArray enumerateObjectsUsingBlock:^(VBarModel* model, NSUInteger idx, BOOL* _Nonnull stop) {
        model.isSelected = NO;
    }];
    self.currentIndex = NSNotFound;
    [self.collectionView reloadData];
}

#pragma mark CollectionView Delegate and DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    VBarCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([VBarCell class]) forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.section];
    cell.indexPath = indexPath;
    cell.delegate = self;
    return cell;
}
- (void)dealloc{
    DDLogWarn(@"被销毁");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
