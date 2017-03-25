//
//  CustomView.m
//  PlayGround
//
//  Created by Caotingjun on 2017/3/15.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "CustomView.h"
#import <Masonry.h>

@interface CustomView()
{
    UIImageView *_imgView;
}

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    _imgView = [[UIImageView alloc] init];
    _imgView.backgroundColor = [UIColor purpleColor];
    [self addSubview:_imgView];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(8, 10, 10, 10));
        make.top.equalTo(self).with.offset(8);
        make.leading.equalTo(self).with.offset(8);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    UIView *aView = [[UIView alloc] init];
    [self addSubview:aView];
    [aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(120, 10));
        make.left.equalTo(_imgView.mas_right).offset(15);
        make.top.equalTo(_imgView.mas_top);
    }];
    aView.backgroundColor = [UIColor whiteColor];
    
    UIView *bView = [[UIView alloc] init];
    [self addSubview:bView];
    [bView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(aView.mas_bottom).offset(8);
        make.size.equalTo(aView);
        make.left.equalTo(aView.mas_left);
    }];
    bView.backgroundColor = [UIColor orangeColor];
    
    UIView *cView = [[UIView alloc] init];
    [self addSubview:cView];
    [cView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bView.mas_bottom).offset(8);
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.bottom.equalTo(self).offset(-8);
    }];
    cView.backgroundColor = [UIColor greenColor];
    
    self.backgroundColor = [UIColor blackColor];
}

#pragma mark - 适用于手写布局，每当父view frame改变，立马自动调用layoutSubView
/*
- (void)layoutSubviews
{
    [super layoutSubviews];
    _imgView.frame = self.bounds;
}
*/

#pragma mark - public
- (void)changeBounds
{
    self.transform = CGAffineTransformScale(self.transform, 0.5, 0.5);
}

@end
