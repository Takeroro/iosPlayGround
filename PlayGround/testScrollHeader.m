//
//  testScrollHeader.m
//  PlayGround
//
//  Created by Terrence on 2017/5/8.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "testScrollHeader.h"

@interface testScrollHeader()
{
    CAShapeLayer *_layer;
}

@end

@implementation testScrollHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initATestLine];
    }
    return self;
}

- (void)initATestLine
{
    _layer = [CAShapeLayer layer];
    _layer.strokeColor = [UIColor blueColor].CGColor;
    _layer.fillColor = [UIColor clearColor].CGColor;
    _layer.lineWidth = 5;
    _layer.lineJoin = kCALineJoinRound;
    _layer.lineCap = kCALineCapRound;
    _layer.strokeStart = 0.1;
    _layer.strokeEnd = 0.5;
    
    _layer.path = [self testPath].CGPath;
    
    [self.layer addSublayer:_layer];
}

- (UIBezierPath *)testPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(CGRectGetMinX(self.bounds), CGRectGetMidY(self.bounds))];
    
    //尖点
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/5 - 5, CGRectGetMidY(self.bounds))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/5, CGRectGetMaxY(self.bounds))];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds)/5 + 5, CGRectGetMidY(self.bounds))];
    //
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMidY(self.bounds))];
    return path;
}

@end
