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
@interface HomeViewController () <UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSMutableArray* dataArray;
@property (nonatomic, strong) VBarBackGroundView* backGroundView;
@property (nonatomic,strong)UITableView * tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpUI];

    // Do any additional setup after loading the view.
}


- (UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]init];
        _tableView.frame = CGRectMake(15, 164, [UIScreen mainScreen].bounds.size.width-40, 300);
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[VBarCell class] forCellReuseIdentifier:[VBarCell cellIdentifier]];
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
    }
    return _tableView;
}

- (VBarBackGroundView*)backGroundView
{
    if (!_backGroundView) {
        _backGroundView = [[VBarBackGroundView alloc] initWithFrame:CGRectMake(70, 164, 300, 300)];
        _backGroundView.backgroundColor = [UIColor clearColor];
        _backGroundView.userInteractionEnabled = NO;
    }
    return _backGroundView;
}

- (void)setUpUI
{
    [self.view addSubview:self.backGroundView];
    //[self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
}

- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray* array = @[ @"2010-1-1-3-4-5", @"2010-2-12", @"2010-3", @"2010-4-123", @"2010",@"2010-1-1-2", @"2010-2-1", @"2010-3-1", @"2010-4-1" ];
        [_dataArray addObjectsFromArray:array];
    }
    return _dataArray;
}

- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 164, [UIScreen mainScreen].bounds.size.width-40, 300-30) collectionViewLayout:layout];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VBarCell * cell = [tableView dequeueReusableCellWithIdentifier:[VBarCell cellIdentifier]];
    return cell;
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
