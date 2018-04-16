//
//  ViewController.m
//  ShapeLayerTest
//
//  Created by sunqiaoqiao on 2018/4/13.
//  Copyright © 2018年 S. All rights reserved.
//

#import "ViewController.h"

static NSString *iden = @"iden";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property ( nonatomic,strong ) UITableView *tab;

@property ( nonatomic,strong ) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Test";
    
    [self.view addSubview:self.tab];
    
}

- (UITableView *)tab{
    if (!_tab) {
        _tab = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tab.rowHeight = 44;
        _tab.delegate = self;
        _tab.dataSource = self;
        [_tab registerClass:[UITableViewCell class] forCellReuseIdentifier:iden];
        _tab.tableFooterView = [[UIView alloc] init];
    }
    return _tab;
}
- (NSArray *)dataArr{
    return @[@"CALayer",@"CAShapLayer",@"Screentshot",@"Transform"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@"CALayerViewController",@"CAShpeLayerViewController",@"ScreenShotViewController",@"TransformViewController"];
    Class class = NSClassFromString(arr[indexPath.row]);
    
    UIViewController *v = (UIViewController *)[[class alloc] init];
    [self.navigationController pushViewController:v animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
