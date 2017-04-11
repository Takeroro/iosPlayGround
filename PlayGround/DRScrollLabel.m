//
//  DRScrollLabel.m
//  PlayGround
//
//  Created by Caotingjun on 2017/4/6.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "DRScrollLabel.h"

@interface DRScrollLabel()
{
    UILabel *_scrollLabel;
    CGSize _textSize;
}

@end

@implementation DRScrollLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultValues];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initDefaultValues];
    }
    return self;
}

- (void)initDefaultValues
{
    self.font = [UIFont systemFontOfSize:15];
}

#pragma mark - public

- (void)startAnimation
{
    _textSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    for (UIView *view  in self.subviews) {
        [view removeFromSuperview];
    }
    int x = self.bounds.size.width / 2 - _textSize.width / 2;
    int y = self.bounds.size.height / 2 - _textSize.height / 2;
    //听说用int 比 float 更高效。特别在动态计算cell高度时，可能导致卡顿。
    _scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, _textSize.width, _textSize.height)];
    
//    [_scrollLabel sizeToFit]; //呢句搞不出动画了··· bound  变成（0，0）因为call这句的时候text为空···
    _scrollLabel.backgroundColor = [UIColor redColor];
    _scrollLabel.text = self.text;
    _scrollLabel.font = self.font;
    _scrollLabel.textColor = [UIColor blackColor];
    [self addSubview:_scrollLabel];
   
    [_scrollLabel sizeToFit];//call 这句之前，text已经有内容了，四舍五入了textSize作为bound.size
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.delegate = self;
    //    animation.fromValue = @(self.bounds.size.width / 2 - textSize.width / 2);
    
    //fromValue, toValue是相对于addAnimation的layer的frame的
    animation.toValue = @(-_textSize.width - _scrollLabel.frame.origin.x);
    
    animation.duration = 3;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [_scrollLabel.layer addAnimation:animation forKey:@"prefix"];
}

#pragma mark - inner



#pragma mark - CAAnimation delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //加下个动画前
    [_scrollLabel.layer removeAnimationForKey:@"prefix"];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.delegate = self;

    CGRect frame = _scrollLabel.frame;
    frame.origin.x = self.frame.size.width;
    _scrollLabel.frame = frame;
    
    animation.toValue = @(-(self.frame.size.width + _textSize.width));
    animation.duration = 6;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [_scrollLabel.layer addAnimation:animation forKey:@"suffix"];
}


@end
