//
//  BeginViewController.m
//  Charts
//
//  Created by chengxun on 16/5/14.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "BeginViewController.h"
#import "VBarViewController.h"
#import <PureLayout.h>
@interface BeginViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSArray * dataArray;
@end

@implementation BeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (NSArray*)dataArray{
    if(!_dataArray){
        _dataArray = @[@"V条形图",@"H条形图"];
    }
    return _dataArray;
}

- (UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"textcell"];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.rowHeight = 100;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)setUpUI{
    [self.tableView autoPinEdgesToSuperviewEdges];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"textcell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        VBarViewController * homeVc = [[VBarViewController alloc]init];
        [self.navigationController pushViewController:homeVc animated:YES];
    }else if(indexPath.row == 1){
        
    }

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
