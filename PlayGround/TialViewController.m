//
//  TialViewController.m
//  PlayGround
//
//  Created by Terrence on 2017/5/8.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "TialViewController.h"
#import "testScrollHeader.h"

@interface TialViewController ()

@end

@implementation TialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    testScrollHeader *header = [[testScrollHeader alloc] initWithFrame:CGRectMake(50, 100, 375-100, 50)];
    [self.view addSubview:header];
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
