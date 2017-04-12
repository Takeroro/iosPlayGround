//
//  MyHeaderView.m
//  PlayGround
//
//  Created by Caotingjun on 2017/2/22.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "MyHeaderView.h"
#import "AnotherView.h"
#import <Masonry.h>

#define visibleOffset 150

@interface MyHeaderView() {
    UIButton *_btn;
    AnotherView *_aView;
}

@end
@implementation MyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBtn];
        [self initAnotherView];
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

- (void)initAnotherView
{
//    _aView = [AnotherView new];
    [self addSubview:[AnotherView sharedObject]];
    [[AnotherView sharedObject] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.equalTo(_btn.mas_left).offset(10);
        make.top.equalTo(_btn.mas_bottom).offset(10);
    }];
    
    //test if give self to aView as ownedView, will trigger [self dealloc]?   won`t!! neither [self dealloc] nor [aView dealloc]. retain cycled!
//    aView.ownedView = self;
    
    //how about a singleton?
    [AnotherView sharedObject].ownedView = self; //also failed
    
    //test if give self to aView as unOwnedView, will trigger dealloc? will!!
//    _aView.unOwnedView = self;

//    _aView.backgroundColor = [UIColor purpleColor];
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
    if (height < visibleOffset) {
        _btn.hidden = YES;
        _aView.hidden = YES;
    } else {
        _btn.hidden = NO;
        _aView.hidden = NO;
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame"];
}

@end
