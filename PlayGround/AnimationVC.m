//
//  AnimationVC.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/26.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "AnimationVC.h"
#import "CustomView.h"

#define randomColor arc4random() / (CGFloat)INT_MAX

@interface AnimationVC ()
{
    CustomView *_aView;
}

@property (weak, nonatomic) IBOutlet UIView *pinkView;
@property (strong, nonatomic) CALayer *colorLayer;

@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _colorLayer = [CALayer new];
    _colorLayer.frame = _pinkView.bounds;
//    [_pinkView.layer addSublayer:_colorLayer];
    _aView = [[CustomView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:_aView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)implicitChange:(id)sender {
    [self performImplcitAnimation];
}

- (IBAction)explicitChange:(id)sender {
    [self performTransitionAnimation];
}

- (IBAction)chageBounds:(id)sender {
    [_aView changeBounds];
}

#pragma mark - explicit animation only deal with Animation,对结果不负责，所以动画结束后需要补上之后显示的属性。
- (void)performTransitionAnimation
{
    [_colorLayer removeFromSuperlayer];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.type = @"suckEffect";
    transition.subtype = kCATransitionFromLeft;
    
    //fire immediately
    [_pinkView.layer addAnimation:transition forKey:nil];
    
    //
    _pinkView.backgroundColor = [UIColor colorWithRed:randomColor green:randomColor blue:randomColor alpha:1.0];
}

#pragma mark - 改变layer属性自动触发隐式动画
- (void)performImplcitAnimation
{
    [_pinkView.layer addSublayer:_colorLayer];
    self.colorLayer.backgroundColor = [UIColor colorWithRed:randomColor green:randomColor blue:randomColor alpha:1.0].CGColor;
}

@end
