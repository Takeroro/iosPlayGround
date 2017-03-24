//
//  ViewControllerWithATable.m
//  PlayGround
//
//  Created by Caotingjun on 16/10/31.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "ViewControllerWithATable.h"

#define tableHeaderHeight 200

@interface ViewControllerWithATable ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation ViewControllerWithATable

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DRScreenWidth, DRScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    [self initTabelHeader];
    [self diretlyAddSubView];
    //测试发现，只要关闭有这句，也就是默认情况下，系统自动适配tablview ，statusbar ,tool bar ,navigationbar覆盖问题
//    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = @(indexPath.row).stringValue;
    // Configure the cell...
    
    return cell;

}

#pragma mark - scroll view delegate 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if (scrollView.contentOffset.y < tableHeaderHeight - 64) {
//        [scrollView setContentOffset:CGPointMake(0, tableHeaderHeight - 64) animated:YES];
//    }
//    NSLog(@"%f",scrollView.contentOffset.y);
}

#pragma mark - inner methods
- (void)initTabelHeader
{
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DRScreenWidth, tableHeaderHeight)];
    aView.backgroundColor = [UIColor yellowColor];
    
    _tableView.tableHeaderView = aView;
    
    [_tableView setContentOffset:CGPointMake(0, tableHeaderHeight - 64) animated:YES];
}

#pragma mark - 效果这个最好，微信logo就是这样加上去的

- (void)diretlyAddSubView
{
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, -tableHeaderHeight, DRScreenWidth, tableHeaderHeight)];
    aView.backgroundColor = [UIColor yellowColor];
    
    [_tableView addSubview:aView];
}


@end
