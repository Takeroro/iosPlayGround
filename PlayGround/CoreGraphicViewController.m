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
#import "DRScrollLabel.h"

@interface CoreGraphicViewController ()
{
    MyDrawView *_myDrawView;
    DRScrollLabel *_testScrollLabel;
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
    [_testScrollLabel startAnimation];
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
    
    _testScrollLabel = [[DRScrollLabel alloc]init];
    _testScrollLabel.text = @"1234567";
    _testScrollLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_testScrollLabel];
    [_testScrollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DRScreenWidth, 50));
        make.top.equalTo(_myDrawView.mas_bottom).offset(50);
        make.leading.equalTo(self.view).offset(0);
    }];
}

@end
