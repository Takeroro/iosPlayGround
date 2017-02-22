//
//  MyHeaderView.m
//  PlayGround
//
//  Created by Caotingjun on 2017/2/22.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "MyHeaderView.h"
@interface MyHeaderView() {
    UIButton *_btn;
}

@end
@implementation MyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBtn];
        [self addObserver];
    }
    return self;
}

#pragma mark - private
- (void)initBtn
{
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(8, 10, 50, 20)];
    [_btn addTarget:self action:@selector(clickTest) forControlEvents:UIControlEventTouchUpInside];
    [_btn setTitle:@"test" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_btn];
}

- (void)addObserver
{
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)clickTest
{
    NSLog(@"clicked");
}

#pragma mark - touch
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isKindOfClass:[self class]]) {
        
        return nil;
    }
    return view;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    CGRect rect = [change[NSKeyValueChangeNewKey] CGRectValue];
    NSLog(@"head view height = %f",rect.size.height);
    CGFloat height = rect.size.height;
    if (height < 80) {
        _btn.hidden = YES;
    } else {
        _btn.hidden = NO;
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame"];
}

@end
