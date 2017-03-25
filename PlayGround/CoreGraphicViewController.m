//
//  CoreGraphicViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/3/16.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "CoreGraphicViewController.h"
#import <Masonry.h>
#import "MyDrawView.h"

@interface CoreGraphicViewController ()
{
    MyDrawView *_myDrawView;
}

@end

@implementation CoreGraphicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_myDrawView runAnimation];
}

- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _myDrawView = [[MyDrawView alloc]init];
    [self.view addSubview:_myDrawView];
    [_myDrawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
}

@end
