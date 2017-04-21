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
    CGRect _orginFrame;
}
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation TestRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *smallTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleRotate)];
    [_myImageView addGestureRecognizer:smallTap];
    //记录原来的frame
    //注意：一旦外部有对_myImageView的约束的话，以后压根不能操作他的frame
    _orginFrame = _myImageView.frame;
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

- (void)toggleRotate
{
    if (_state == rotateState_rotated) {
        [UIView animateWithDuration:0.8 animations:^{
            _myImageView.transform = CGAffineTransformIdentity;//origial
            //注意：一旦外部有对_myImageView的约束的话，以后压根不能操作他的frame
            _myImageView.frame = _orginFrame;
        } completion:^(BOOL finished) {
            _state = rotateState_normal;
            [_myImageView removeFromSuperview];
            
            [self.view addSubview:_myImageView];
        }];
        
    } else {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:_myImageView];
    
        CGRect rectInWindow = [self.view convertRect:_myImageView.frame toView:keyWindow];
        [_myImageView removeFromSuperview];
        _myImageView.frame = rectInWindow;
        [keyWindow addSubview:_myImageView];
    
        [UIView animateWithDuration:0.8 animations:^{
            _myImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
            _myImageView.frame = CGRectMake(0, 0, DRScreenWidth, DRScreenHeight);
            _myImageView.center = CGPointMake(DRScreenWidth/2, DRScreenHeight/2);
        } completion:^(BOOL finished) {
            _state = rotateState_rotated;
        }];
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
