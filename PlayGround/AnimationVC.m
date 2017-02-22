//
//  AnimationVC.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/26.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "AnimationVC.h"

@interface AnimationVC ()

@property (weak, nonatomic) IBOutlet UIView *pinkView;
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _colorLayer = [CALayer new];
    _colorLayer.frame = _pinkView.bounds;
    [_pinkView.layer addSublayer:_colorLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(id)sender {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
}

@end
