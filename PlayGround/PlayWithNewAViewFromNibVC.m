//
//  PlayWithNewAViewFromNibVC.m
//  PlayGround
//
//  Created by Caotingjun on 2017/2/10.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "PlayWithNewAViewFromNibVC.h"
#import "BlankView.h"
#import "DRGlobalMacro.h"

@interface PlayWithNewAViewFromNibVC ()

@end

@implementation PlayWithNewAViewFromNibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BlankView *aView = [BlankView initFromNib];
    aView.frame = CGRectMake(0, 100, DRScreenWidth, 100);
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DRScreenWidth, DRScreenHeight) style:UITableViewStyleGrouped];
    aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:tableView];
    [tableView addSubview:aView];
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
