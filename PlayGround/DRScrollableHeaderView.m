//
//  DRScrollableHeaderView.m
//  PlayGround
//
//  Created by Caotingjun on 16/10/28.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "DRScrollableHeaderView.h"



//#define HeadButtonWidth 100
#define HeadButtonHeight 64
#define HeadHeight 64
#define HeadY 200

@interface DRScrollableHeaderView()
{
    NSArray *_dataArray;
    UIScrollView *_scollView;
    NSInteger _currentSelectedIndex;
}

@end
@implementation DRScrollableHeaderView


#pragma mark - public

- (instancetype)initWithFrame:(CGRect)frame
                        array:(NSArray *)array
                     delegate:(id<DRScrollHeaderDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = array;
        _delegate = delegate;
        self.backgroundColor = [UIColor blackColor];
        [self setUI];
//        [self setUI_4test];
    }
    return self;
}


- (instancetype)initWithArray:(NSArray *)array
                     delegate:(id<DRScrollHeaderDelegate>) delegate
{
    
    return [self initWithFrame:CGRectMake(0, 0, DRScreenWidth, HeadHeight) array:array delegate:delegate];
}


#pragma mark - private
- (void)setUI
{
    CGFloat btnWidth = /* DRScreenWidth / _dataArray.count > 100 ? DRScreenWidth / _dataArray.count :*/ 100;
    _scollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, DRScreenWidth, HeadHeight)];
    _scollView.backgroundColor = [UIColor yellowColor];
    _scollView.contentSize = CGSizeMake(_dataArray.count * btnWidth, HeadHeight);
    _scollView.showsHorizontalScrollIndicator = NO;
    _scollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scollView];
    
    
    for (int i = 0; i < _dataArray.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i* btnWidth, 0, btnWidth, HeadHeight)];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitle:_dataArray[i] forState:UIControlStateNormal];
        btn.tag = i;
//        [btn addTarget:self action:@selector(didSelected:) forControlEvents:UIControlEventTouchUpInside];
        [_scollView addSubview:btn];
    }
    
}


- (void)setUI_4test
{
    /*
    这句要不得啊，self.frame 是sefl相当于superview的相对位置，只要self初始不为0，（如y = 20），传来就是（0，20，width,height）,而这个20又是blueView相对于self 的20了
    UIView *blue = [[UIView alloc] initWithFrame:self.frame];
     除非self的frame恒为0 不变了，才可以用上面那句实现效果。
    */
    UIView *blue = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DRScreenWidth, HeadHeight)];
    blue.backgroundColor = [UIColor blueColor];
    [self addSubview:blue];
}
- (void)didSelected:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(pageMoveFrom:to:)]) {
        [self.delegate pageMoveFrom:_currentSelectedIndex to:btn.tag];
        _currentSelectedIndex = btn.tag;
    }
}
@end
