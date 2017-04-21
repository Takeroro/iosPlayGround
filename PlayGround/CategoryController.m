//
//  CategoryController.m
//  PlayGround
//
//  Created by Caotingjun on 16/10/28.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "CategoryController.h"
#import "TestSrollableHeaderController.h"
#import "TableViewController.h"
#import "ViewControllerWithATable.h"
#import "RunLoopAndTimerController.h"
#import "PlayWithNSCodingController.h"
#import "DrawBoradViewController.h"
#import "PlayInvocationVC.h"
#import "PlayWithWindowViewController.h"
#import "AnimationVC.h"
#import "ExceptionViewController.h"
#import "PlayWithNewAViewFromNibVC.h"
#import "AppStoreDemoViewController.h"
#import "CoreGraphicViewController.h"
#import "RunTimeViewController.h"
#import "TestRotateViewController.h"

@interface CategoryController ()
{
    NSMutableArray *_dataArray;
}

@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"我是目录";
    
    _dataArray = [NSMutableArray new];
    [_dataArray addObject:[TestSrollableHeaderController class]];
    [_dataArray addObject:[TableViewController class]];
    [_dataArray addObject:[ViewControllerWithATable class]];
    [_dataArray addObject:[RunLoopAndTimerController class]];
    [_dataArray addObject:[PlayWithNSCodingController class]];
    [_dataArray addObject:[DrawBoradViewController class]];
    [_dataArray addObject:[PlayInvocationVC class]];
    [_dataArray addObject:[PlayWithWindowViewController class]];
    [_dataArray addObject:[AnimationVC class]];
    [_dataArray addObject:[ExceptionViewController class]];
    [_dataArray addObject:[PlayWithNewAViewFromNibVC class]];
    [_dataArray addObject:[AppStoreDemoViewController class]];
    [_dataArray addObject:[CoreGraphicViewController class]];
    [_dataArray addObject:[RunTimeViewController class]];
    [_dataArray addObject:[TestRotateViewController class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"play with Scroll Header & AddChildViewController:";
            break;
        case 1:
            cell.textLabel.text = @"打开了self.automaticallyAdjustsScrollViewInsets = NO ";
            break;
        case 2:
            cell.textLabel.text = @"关闭了self.automaticallyAdjustsScrollViewInsets = NO ";
            break;
        case 8:
            cell.textLabel.text = @"显隐动画，layoutSubViews, masonary";
            break;

        default:
            cell.textLabel.text = NSStringFromClass(_dataArray[indexPath.row]);
            break;
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            TestSrollableHeaderController *scrollHeader = [TestSrollableHeaderController new];
            [self.navigationController pushViewController:scrollHeader animated:YES];
            break;
        }
        case 1: {
            TableViewController *table = [[TableViewController alloc]init];
            [self.navigationController pushViewController:table animated:YES];
            break;
        }
        case 2: {
            ViewControllerWithATable *dick = [[ViewControllerWithATable alloc]init];
            [self.navigationController pushViewController:dick animated:YES];
            break;
        }
        case 3: {
            RunLoopAndTimerController *dick = [[RunLoopAndTimerController alloc]init];
            [self.navigationController pushViewController:dick animated:YES];
            break;
        }
        case 4: {
            PlayWithNSCodingController *dick = [[PlayWithNSCodingController alloc]init];
            [self.navigationController pushViewController:dick animated:YES];
            break;
        }
        case 5: {
            DrawBoradViewController *dick = [[DrawBoradViewController alloc]init];
            [self.navigationController pushViewController:dick animated:YES];
            break;
        }
        case 6: {
            PlayInvocationVC *vc = [[PlayInvocationVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7: {
            PlayWithWindowViewController *vc = [[PlayWithWindowViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 8: {
            AnimationVC *vc = [[AnimationVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 9: {
            ExceptionViewController *vc = [[ExceptionViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 10: {
            PlayWithNewAViewFromNibVC *vc = [[PlayWithNewAViewFromNibVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 11: {
            AppStoreDemoViewController *vc = [[AppStoreDemoViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 12: {
            CoreGraphicViewController *vc = [[CoreGraphicViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 13: {
            RunTimeViewController *vc = [[RunTimeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 14: {
            TestRotateViewController *vc = [[TestRotateViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }

    }
}
@end
