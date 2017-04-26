//
//  TestRotateViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/4/21.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "TestRotateViewController.h"
#import "DRGlobalMacro.h"
#import <Masonry.h>
#import "ExpandableCellView.h"

typedef enum : NSUInteger {
    rotateState_normal,
    rotateState_rotated,
} rotateState;

@interface TestRotateViewController ()<ExpandableCellViewDelegate>
{
    rotateState _state;
    
    //这两个cgrect是同一个位置基于2个不同superView的值
    CGRect _orginFrame;
    CGRect _rectInWindow;
    
    UIImageView *_myImageView;
    __weak IBOutlet ExpandableCellView *expandView;
}

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation TestRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).priorityHigh();
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
//    [self initMyImageView];
    
    _containerView.backgroundColor = [UIColor blueColor];
    [super updateViewConstraints];
//    [self.view layoutIfNeeded];
    [self initExpandView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    [_myImageView removeFromSuperview];
}

- (void)viewWillLayoutSubviews
{
//    [self initMyImageView];
}

- (void)viewDidLayoutSubviews
{
    [self initMyImageView];//经过mac_update后，知道这里_containerView的frame才是我们想要的。
}

- (BOOL)shouldAutorotate
{
    return NO;
}

#pragma mark - private

- (void)initExpandView
{
    [expandView setString:@"hahah" withLabelHeight:50 btnHeight:60];
    expandView.delegate = self;
}

- (void)initMyImageView
{
    _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
//    _myImageView.center = _containerView.center;//这句有毒，_continerView.center是相对于self.View的，没用
    
    _myImageView.center = CGPointMake(_containerView.frame.size.width/2, _containerView.frame.size.height/2);
    
    _myImageView.image = [UIImage imageNamed:@"guoguo"];
    _myImageView.userInteractionEnabled = YES;
    [_containerView addSubview:_myImageView];
    
    UITapGestureRecognizer *smallTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleRotate)];
    [_myImageView addGestureRecognizer:smallTap];
    //记录原来的frame
    //注意：一旦外部有对_myImageView的约束的话，以后压根不能操作他的frame
    _orginFrame = _myImageView.frame;
}


- (void)toggleRotate
{
    if (_state == rotateState_rotated) {
        [self exitFullScreen];
    } else {
        [self enterFullScreen];
    }
}

- (void)exitFullScreen
{
    [UIView animateWithDuration:0.8 animations:^{
        _myImageView.transform = CGAffineTransformIdentity;//origial
        //注意：一旦外部有对_myImageView的约束的话，以后压根不能操作他的frame
        _myImageView.frame = _rectInWindow;
    } completion:^(BOOL finished) {
        _state = rotateState_normal;
        [_myImageView removeFromSuperview];
        
        [_containerView addSubview:_myImageView];
        
        _myImageView.frame = _orginFrame;
    }];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
}

- (void)enterFullScreen
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:_myImageView];
    
    _rectInWindow = [_containerView convertRect:_myImageView.frame toView:keyWindow];
    
    [_myImageView removeFromSuperview];
    _myImageView.frame = _rectInWindow;
    [keyWindow addSubview:_myImageView];
    
    [UIView animateWithDuration:0.8 animations:^{
        _myImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        _myImageView.frame = CGRectMake(0, 0, DRScreenWidth, DRScreenHeight);
        _myImageView.center = CGPointMake(DRScreenWidth/2, DRScreenHeight/2);
    } completion:^(BOOL finished) {
        _state = rotateState_rotated;
    }];
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
}

- (void)expandableViewStateChange:(BOOL)isExpand
{
    if (isExpand) {
        [expandView setString:@"hahahahababallblblbbblb阿斯顿发送到发送到阿萨德发毒誓hahahdiunilaomuhi" withLabelHeight:100 btnHeight:60];
    } else {
        [expandView setString:@"hahahaha" withLabelHeight:50 btnHeight:60];
    }
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
