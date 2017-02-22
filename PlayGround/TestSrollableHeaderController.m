//
//  ViewController.m
//  PlayGround
//
//  Created by Caotingjun on 16/10/28.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "TestSrollableHeaderController.h"
#import "DRScrollableHeaderView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface TestSrollableHeaderController ()<DRScrollHeaderDelegate>{
    DRScrollableHeaderView *_headerView;
    NSArray<UIViewController *> *_controllerArray;
}

@end

@implementation TestSrollableHeaderController

#pragma mark - view controller life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setScrollHeader];
//    [self setDisplayView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private
- (void)setScrollHeader
{
    NSArray *array = @[@"1",@"2",@"3",@"4"];
    
    _headerView = [[DRScrollableHeaderView alloc] initWithArray:array delegate:self];
    
    //dick??? 必须有这句话，不然系统自动调整scrollView ,navigationBar，toolBar图层遮挡关系。
    self.automaticallyAdjustsScrollViewInsets =NO;

    [self.view addSubview:_headerView];

    
}
// play with add child view controller
- (void)setDisplayView
{
    FirstViewController *fst = [[FirstViewController alloc] init];
    [fst.view setFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), DRScreenWidth, DRScreenHeight)];
    [self addChildViewController:fst];
    [self.view addSubview:fst.view];
    
    SecondViewController *scd = [SecondViewController new];
    [scd.view setFrame:fst.view.frame];
    _controllerArray = @[fst,scd];
}
#pragma mark - Scroll HeadView delegate
-(void)pageMoveFrom:(NSInteger)fromIndex to:(NSInteger)toIndex
{

    if (fromIndex == toIndex) {
        return;
    }
    
    [self addChildViewController:_controllerArray[toIndex]];

    [self transitionFromViewController:_controllerArray[fromIndex]
                      toViewController:_controllerArray[toIndex]
                              duration:2
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                if (finished) {
                                    [_controllerArray[toIndex] didMoveToParentViewController:self];
                                    [_controllerArray[fromIndex] willMoveToParentViewController:nil];
                                    [_controllerArray[fromIndex] removeFromParentViewController];
                                }
        
    }];
}

@end
