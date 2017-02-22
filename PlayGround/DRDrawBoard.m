//
//  DRDrawBoard.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/9.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "DRDrawBoard.h"
@interface DRDrawBoard()
{
    NSMutableArray<NSValue *> *_pointsArray;
    CAShapeLayer *_boradLayer;
    UIBezierPath *_drawTrack;
}
@end


@implementation DRDrawBoard

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    _pointsArray = [NSMutableArray new];
    
    _drawTrack = [[UIBezierPath alloc] init];

    _boradLayer = [[CAShapeLayer alloc] init];
    _boradLayer.strokeColor = self.penColor.CGColor;
    _boradLayer.lineWidth = self.strokeWidth;
    
//    [self.layer addSublayer:_boradLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //first blood?
    [_drawTrack moveToPoint: point];
    [_drawTrack stroke];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [_pointsArray addObject:[NSValue valueWithCGPoint:point]];
    [self drawFromPoint:point];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark - public
- (void)clear
{
    
}

- (void)replay
{
    
}

#pragma mark - core
- (void)drawFromPoint:(CGPoint)point
{
    [_drawTrack addLineToPoint:point];
//    _boradLayer.path = _drawTrack.CGPath;
    [_drawTrack stroke];
}



@end
