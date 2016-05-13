//
//  HomeViewController.m
//  Charts
//
//  Created by chengxun on 16/5/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HomeViewController.h"
#import <PureLayout.h>
#import "LabelCell.h"
#import "VBarBackGroundView.h"
#import "VBarCell.h"
#import "ChartsTitleView.h"
@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource,ChartViewDelegate>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) VBarBackGroundView* backGroundView;
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)ChartsTitleView * titleView;/**<  滚动视图  */
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];


    // Do any additional setup after loading the view.
}

- (ChartsTitleView*)titleView{
    if(!_titleView){
        _titleView = [[ChartsTitleView alloc]initWithFrame:CGRectMake(15, 20+64, [UIScreen mainScreen].bounds.size.width-30, 154/2)];
        _titleView.dataArray = [NSMutableArray arrayWithArray:@[@"销售额总和",@"客户名",@"筛选条件1,筛选条件2,筛选条件3,筛选条件4,筛选条件5,筛选条件6,筛选条件7,筛选条件8,筛选条件9,筛选条件10"]];
        NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
        dictionary[NSFontAttributeName] = [UIFont systemFontOfSize:13];
        CGSize size = [_titleView.dataArray.lastObject sizeWithAttributes:dictionary];
        _titleView.contentSize = CGSizeMake(size.width+36, 0);
    }
    return _titleView;
}

- (VBarBackGroundView*)backGroundView
{
    if (!_backGroundView) {
        _backGroundView = [[VBarBackGroundView alloc] initWithFrame:CGRectMake(70, 131+64, 300, 300)];
        _backGroundView.backgroundColor = [UIColor clearColor];
        _backGroundView.userInteractionEnabled = NO;
    }
    return _backGroundView;
}

- (void)setUpUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.backGroundView];
    [self.view addSubview:self.collectionView];
}

- (void)userClickedOnVBarIndexItem:(NSInteger)vBarIndex{
    DDLogInfo(@"%zi",vBarIndex);
}

- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray* array = @[ @"2010-1-1-3-4-5", @"2010-2-12", @"2010-3", @"2010-4-123", @"2010",@"2010-1-1-2", @"2010-2-1", @"2010-3-1", @"2010-4-1",@"2010-11",@"2010-223123131",@"2010-2-2-33" ];
        [_dataArray addObjectsFromArray:array];
    }
    return _dataArray;
}

- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 131+64, [UIScreen mainScreen].bounds.size.width-40, 300-20) collectionViewLayout:layout];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        [_collectionView registerClass:[LabelCell class] forCellWithReuseIdentifier:NSStringFromClass([LabelCell class])];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-40, 50);
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
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
