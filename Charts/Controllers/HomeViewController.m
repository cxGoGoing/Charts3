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
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];


    // Do any additional setup after loading the view.
}

- (void)setUpUI{

    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:164];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:20];
    [self.collectionView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:20];
    [self.collectionView autoSetDimension:ALDimensionHeight toSize:300];

}

- (NSMutableArray*)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
        NSArray * array = @[@"2010-1-1",@"2010-2-1",@"2010-3-1",@"2010-4-1",@"2010-5-1"];
        [_dataArray addObjectsFromArray:array];
    }
    return _dataArray;
}

- (UICollectionView*)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        [_collectionView registerClass:[LabelCell class] forCellWithReuseIdentifier:NSStringFromClass([LabelCell class])];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        layout.itemSize = CGSizeMake(375-40, 50);
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LabelCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LabelCell class]) forIndexPath:indexPath];
    cell.textString = self.dataArray[indexPath.section];
    return cell;
}

- (void)didReceiveMemoryWarning {
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
