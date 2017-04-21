//
//  AppStoreDemoViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/2/22.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "AppStoreDemoViewController.h"
#import "MyHeaderView.h"
#import "DRGlobalMacro.h"

static int HeaderViewHeight = 200;

@interface AppStoreDemoViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    MyHeaderView *_headerView;
}

@end

@implementation AppStoreDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTableView];
    [self initHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private 
- (void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DRScreenWidth, DRScreenHeight) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor purpleColor];
    _tableView.contentInset = UIEdgeInsetsMake(HeaderViewHeight, 0, 0, 0);
    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_tableView];
}

- (void)initHeaderView
{
    _headerView = [[MyHeaderView alloc] initWithFrame:CGRectMake(0, 64, DRScreenWidth, HeaderViewHeight)];
    _headerView.backgroundColor = [UIColor yellowColor];
    [_headerView addObserver:self forKeyPath:@"testString" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_headerView];
}


#pragma mark - uitableView dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

#pragma mark - scrollview delegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"willENdDragging:%f",scrollView.contentOffset.y);
    if (targetContentOffset->y > -132 && targetContentOffset->y < -64) {
        *targetContentOffset = CGPointMake(0, -64);
    } else if (targetContentOffset->y <= -132 && targetContentOffset->y > -264) {
        *targetContentOffset = CGPointMake(0, -264);
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        NSLog(@"KVO:%f",offset.y);
        
        if (offset.y > -(HeaderViewHeight +navigationBarHeightPlusStatusBarHeight) && offset.y < -navigationBarHeightPlusStatusBarHeight) {
            CGRect frame = _headerView.frame;
            frame.size.height = - navigationBarHeightPlusStatusBarHeight - offset.y;
            _headerView.frame = frame;
        } else if (offset.y <= -(HeaderViewHeight +navigationBarHeightPlusStatusBarHeight)) {
            _headerView.frame = CGRectMake(0, navigationBarHeightPlusStatusBarHeight, DRScreenWidth, HeaderViewHeight);
        } else if (offset.y >= -navigationBarHeightPlusStatusBarHeight) {
            _headerView.frame = CGRectMake(0, navigationBarHeightPlusStatusBarHeight, DRScreenWidth, 0);
        }
    }else if ([keyPath isEqualToString:@"testString"]) {
        NSLog(@"kvo testString");
    }
}

-(void)dealloc
{
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
    [_headerView removeObserver:self forKeyPath:@"testString"];
}

@end
