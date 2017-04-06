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
    NSUInteger _sum;
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
    _sum = 3;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _sum = 5;
        [_tableView reloadData];
    });

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _sum;
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

//手指drag不会触发这个方法，当且仅当setContentOffset(_:animated:)或者scrollRectVisible(_:animated:)），scrollToItemAtIndexPath:，且 animation= YES时，动画结束时会调用该方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

//scrollToItemAtIndexPath 却不会触发减速动画回调，可能减速只为drag而设的？
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

#pragma mark - inner methods
- (void)initTabelHeader
{
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DRScreenWidth, tableHeaderHeight)];
    aView.backgroundColor = [UIColor yellowColor];
    
    _tableView.tableHeaderView = aView;
    
    [_tableView setContentOffset:CGPointMake(0, tableHeaderHeight - 64) animated:YES];
}

- (void)initBackGroundView
{
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, -DRScreenHeight, DRScreenWidth, tableHeaderHeight)];
    aView.backgroundColor = [UIColor yellowColor];
    
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    subView.backgroundColor = [UIColor whiteColor];
    [aView addSubview:subView];
    
    _tableView.backgroundView = aView;
}

#pragma mark - 效果这个最好，微信logo就是这样加上去的

- (void)diretlyAddSubView
{
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, -tableHeaderHeight, DRScreenWidth, tableHeaderHeight)];
    aView.backgroundColor = [UIColor yellowColor];
    
    [_tableView addSubview:aView];
}


@end
