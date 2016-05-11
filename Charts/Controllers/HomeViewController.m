//
//  HomeViewController.m
//  Charts
//
//  Created by chengxun on 16/5/5.
//  Copyright © 2016年 chengxun. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 120, 20)];
    label.font = [UIFont systemFontOfSize:15];
    label.text = @"monoca2015666";
    label.transform = CGAffineTransformMakeRotation(-M_PI/4);
    DDLogInfo(@"%@",NSStringFromCGRect(label.frame));
    [self.view addSubview:label];


    // Do any additional setup after loading the view.
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
