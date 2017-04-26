//
//  ExpandableCellView.m
//  PlayGround
//
//  Created by Terrence on 2017/4/27.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "ExpandableCellView.h"
#import <Masonry.h>

@interface ExpandableCellView()
{
    BOOL _isExpand;
    UILabel *_label;
    UIButton *_btn;
}
@end

@implementation ExpandableCellView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)initUI
{
    _label = [UILabel new];
    [self addSubview:_label];
    _label.backgroundColor = [UIColor yellowColor];
    _label.numberOfLines = 0;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_equalTo(50);
        make.width.equalTo(self.mas_width);
    }];
    
    _btn = [UIButton new];
    [self addSubview:_btn];
    _btn.backgroundColor = [UIColor purpleColor];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(_label.mas_bottom);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    [_btn addTarget:self action:@selector(onBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_btn setTitle:@"展开" forState:UIControlStateNormal];
}

- (void)setString:(NSString *)str withLabelHeight:(CGFloat)labelHeight btnHeight:(CGFloat)btnHeight
{
    
    _label.text = str;
    [_label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(labelHeight);
    }];
    [_btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(btnHeight);
    }];

//    [self layoutIfNeeded];
}

- (void)onBtnClicked
{
    _isExpand = !_isExpand;
    
    if (!_isExpand) {
        [_btn setTitle:@"展开" forState:UIControlStateNormal];
    } else {
        [_btn setTitle:@"收起" forState:UIControlStateNormal];
    }
    if ([self.delegate respondsToSelector:@selector(expandableViewStateChange:)]) {
        [self.delegate expandableViewStateChange:_isExpand];
    }
}

@end
