//
//  ViewControllerWithATable.m
//  PlayGround
//
//  Created by Caotingjun on 16/10/31.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "ViewControllerWithATable.h"


@interface ViewControllerWithATable ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewControllerWithATable

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DRScreenWidth, DRScreenHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    
    return 14;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = @(indexPath.row).stringValue;
    // Configure the cell...
    
    return cell;

}


@end
