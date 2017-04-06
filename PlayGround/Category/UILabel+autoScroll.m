//
//  UILabel+UILabel_scroll.m
//  PlayGround
//
//  Created by Caotingjun on 2017/4/6.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "UILabel+autoScroll.h"

//这种实现不实际，不断增加 label 有毛病···

@implementation UILabel (autoScroll)

- (void)startAnimation
{
    CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    for (UIView *view  in self.subviews) {
        [view removeFromSuperview];
    }
    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 - textSize.width / 2, self.bounds.size.height / 2 - textSize.height / 2, textSize.width, textSize.height)];
    
//    [subLabel sizeToFit]; 呢句搞不出动画了···
    subLabel.backgroundColor = [UIColor redColor];
    subLabel.text = @"abcdefg";
    subLabel.textColor = self.textColor;
    [self addSubview:subLabel];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.delegate = self;
//    animation.fromValue = @(self.bounds.size.width / 2 - textSize.width / 2);
    
    //fromValue, toValue是相对于addAnimation的layer的frame的
    animation.toValue = @(-textSize.width - subLabel.frame.origin.x);
    animation.duration = 3;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [subLabel.layer addAnimation:animation forKey:nil];
}

#pragma mark - inner



#pragma mark - CAAnimation delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width + textSize.width, self.bounds.size.height / 2 - textSize.height / 2, textSize.width, textSize.height)];
    subLabel.backgroundColor = [UIColor redColor];
    subLabel.text = @"abcdefg";
    subLabel.textColor = self.textColor;
    [self addSubview:subLabel];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.delegate = self;
    //    animation.fromValue = @(self.bounds.size.width / 2 - textSize.width / 2);
    
    //fromValue, toValue是相对于addAnimation的layer的frame的
    animation.toValue = @(-textSize.width - subLabel.frame.origin.x);
    animation.duration = 3;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [subLabel.layer addAnimation:animation forKey:nil];
}

@end
