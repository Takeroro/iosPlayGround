//
//  TestRotateViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/4/21.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "TestRotateViewController.h"
#import "DRGlobalMacro.h"

typedef enum : NSUInteger {
    rotateState_normal,
    rotateState_rotated,
} rotateState;

@interface TestRotateViewController ()
{
    rotateState _state;
    
    //这两个cgrect是同一个位置基于2个不同superView的值
    CGRect _orginFrame;
    CGRect _rectInWindow;
    
    UIImageView *_myImageView;
}

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation TestRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMyImageView];
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

#pragma mark - private

- (void)initMyImageView
{
    _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
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
