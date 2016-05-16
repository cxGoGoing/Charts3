//
//  HomeViewController.m
//  Charts
//
//  Created by chengxun on 16/5/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HomeViewController.h"
#import "LabelCell.h"
#import "VBarBackGroundView.h"
#import "VBarCell.h"
#import "ChartsTitleView.h"
@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource, ChartViewDelegate>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) VBarBackGroundView* backGroundView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) ChartsTitleView* titleView; /**<  滚动视图  */
@property (nonatomic, strong) UIButton* siftBtn;
@end

static const CGFloat kBottomHeight = 60;/**<  筛选按钮高度  */
static const CGFloat kMarginY = 30;/**<  collectionView的高度和底部backView的Y方向高度差  */
static const CGFloat kMarginBottom = 30;/**<  colleciontView和底部bottom的距离  */

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];

    // Do any additional setup after loading the view.
}

- (ChartsTitleView*)titleView
{
    if (!_titleView) {
        _titleView = [[ChartsTitleView alloc] initWithFrame:CGRectMake(15, 20 + 64, [UIScreen mainScreen].bounds.size.width - 30, 154 / 2)];
        _titleView.dataArray = @[ @"销售额总和", @"客户名", @"筛选条件1,筛选条件2,筛选条件3,筛选条件4,筛选条件5,筛选条件6,筛选条件7,筛选条件8,筛选条件9,筛选条件10" ];
        _titleView.contentSize = CGSizeMake(calTextSize(_titleView.dataArray.lastObject, 13).width + 36, 0);
    }
    return _titleView;
}

static inline CGSize calTextSize(NSString* text, NSInteger font)
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    dictionary[NSFontAttributeName] = [UIFont systemFontOfSize:font];
    CGSize size = [text sizeWithAttributes:dictionary];
    return size;
}
static inline CGFloat calBackViewHeight(){
    CGFloat height = [UIScreen mainScreen].bounds.size.height -20-154/2-30-kBottomHeight-10-kMarginBottom-30;
    return height;
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
        NSArray* array = @[ @"北首开知语城", @"小米科技棒棒哒", @"中关村科技", @"2015-05", @"2015-06", @"2015-07", @"2015-08", @"2015-09", @"2015-11", @"2015-12-31", @"2016-12-01-1", @"北首开知语城", @"小米科技棒棒哒", @"中关村科技", @"2015-05", @"2015-06", @"2015-07", @"2015-08", @"2015-09", @"2015-11", @"2015-12-31", @"2016-12-01-1" ];
        [_dataArray addObjectsFromArray:array];
    }
    return _dataArray;
}

- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 131 + 64, [UIScreen mainScreen].bounds.size.width - 30, calBackViewHeight()-kMarginY) collectionViewLayout:layout];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        [_collectionView registerClass:[LabelCell class] forCellWithReuseIdentifier:NSStringFromClass([LabelCell class])];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 22, 0);
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 40);
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)siftData:(UIButton*)btn
{
    self.titleView.dataArray = @[ @"销售总和", @"客户名", @"筛选条件" ];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:@[ @"1", @"12", @"123", @"1234" ]];
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

- (void)userClickedOnVBarIndexItem:(NSInteger)vBarIndex
{
    DDLogInfo(@"%zi", vBarIndex);
}

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
    LabelCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LabelCell class]) forIndexPath:indexPath];
    cell.textString = self.dataArray[indexPath.section];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
