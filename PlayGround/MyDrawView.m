//
//  MyDrawView.m
//  PlayGround
//
//  Created by Caotingjun on 2017/3/16.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "MyDrawView.h"
#import <mach/mach_time.h>

@interface MyDrawView()<CAAnimationDelegate>
{
    CAShapeLayer *_shapeLayer;
    CFTimeInterval _startTime;
    BOOL _isPlaying;
    BOOL _done;
}
@end

@implementation MyDrawView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
//    [self getCurrentCtxAndDraw];
    
    [self initMyShapeLayer];
}


#pragma mark - 两种方法get context

- (void)getCurrentCtxAndDraw
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 0);
    CGPathAddLineToPoint(path, nil, 100, 100);
    CGPathAddLineToPoint(path, nil, 0, 200);
    
    CGContextAddPath(ctx, path);//add path to context
    
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);//填充颜色
    
    CGContextDrawPath(ctx, kCGPathFill);//draw context
    
    
    CGPathMoveToPoint(path, nil, 100, 100);
    CGPathAddLineToPoint(path, nil, 200, 200);
    CGContextAddPath(ctx, path);//add path to context
    
    // CGContextSet -> to set context property
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(ctx, 0, 1.0, 0, 1);//填充颜色
    
    CGContextDrawPath(ctx, kCGPathFillStroke);//draw context
    
    CGPathRelease(path);//release
}

- (UIImage *)resizeImg:(UIImage *)img
           toSize:(CGSize)resize
{
    UIGraphicsBeginImageContext(CGSizeMake(resize.width, resize.height));//打开位图上下文
    
    [img drawInRect:CGRectMake(0, 0, resize.width, resize.height)];//draw
    
    UIImage *resizedImg = UIGraphicsGetImageFromCurrentImageContext();//get
    
    UIGraphicsEndImageContext();//关闭
    
    return resizedImg;
}

#pragma mark - CAShapeLayer & Animation

- (void)initMyShapeLayer
{
    _shapeLayer = [[CAShapeLayer alloc] init];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineWidth = 5;
    _shapeLayer.lineJoin = kCALineJoinRound;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.strokeStart = 0;
    _shapeLayer.strokeEnd = 0;
    
    _shapeLayer.path = [self ovalPathV2].CGPath;
    
    [self.layer addSublayer:_shapeLayer];
}

#pragma mark - bezierPathWithOvalInRect: 起始点在3点位置,不合符预期

- (UIBezierPath *)ovalPathV1
{
    CGFloat radius = self.frame.size.width / 2 * 0.8;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.frame.size.width/2 - radius, self.frame.size.height/2 - radius, radius * 2, radius * 2)];
    return path;
}


#pragma mark - bezierPathWithArcCenter:能控制起始角度

- (UIBezierPath *)ovalPathV2
{
    CGFloat radius = self.frame.size.width / 2 * 0.8;
    
    //打算把圆形放在控件中心，但一直显示不出，才发现self.center是相对superView的位置
    //self.center 返回的是相对于superView的位置
    //在控件内部求center唯有用（width/2,height/2）
    NSLog(@"center(%f,%f)",self.center.x,self.center.y);
    NSLog(@"center to real(%f,%f)",self.bounds.size.width/2,self.bounds.size.width/2);
    

    UIBezierPath *path = [UIBezierPath bezierPath];
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2,self.bounds.size.width/2) radius:radius startAngle:-0.5 * M_PI endAngle:1.5 * M_PI clockwise:YES];
    
    return path;
}

- (void)runAnimation
{
//    [self runAnimationV1];
//    [self runAnimationV2];
}

- (void)runAnimationV1
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3;
    animation.fromValue = @(0);
    animation.toValue = @(1.0);
    animation.repeatCount = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [_shapeLayer addAnimation:animation forKey:@"animationV1"];
    
    CFTimeInterval cTime = [_shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    NSLog(@"start Time = %f",cTime);
    _startTime = cTime;
}

- (void)runAnimationV2
{
    CABasicAnimation *strokeStAnim = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStAnim.fromValue = @(-0.5);
    strokeStAnim.toValue = @(1);
    
    CABasicAnimation *strokeEndAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnim.fromValue = 0;
    strokeEndAnim.toValue = @(1);
    
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc]init];
    animationGroup.animations = @[strokeStAnim,strokeEndAnim];
    animationGroup.duration = 3;
    animationGroup.repeatCount = MAXFLOAT;
    
    [_shapeLayer addAnimation:animationGroup forKey:nil];
}

- (void)pauseAnimation
{
    // 将当前时间CACurrentMediaTime转换为layer上的时间, 即将parent time转换为local time
    CFTimeInterval pauseTime = [_shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 设置layer的timeOffset, 在继续操作也会使用到
    _shapeLayer.timeOffset = pauseTime;
    
    // local time与parent time的比例为0, 意味着local time暂停了
    _shapeLayer.speed = 0;
}

- (void)pauseAndAddMask
{
    if (_done) {
        return;
    }
    
    CFTimeInterval pauseTime = [_shapeLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    _shapeLayer.timeOffset = pauseTime;
    
    _shapeLayer.speed = 0;

    CGFloat radius = self.frame.size.width / 2 * 0.8;
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.strokeColor = [UIColor purpleColor].CGColor;
    maskLayer.lineWidth = 5;
    maskLayer.lineCap = kCALineCapButt;
    CFTimeInterval spaceTime = pauseTime - _startTime;
    
    NSLog(@"spaceTime = %f",spaceTime);
    
    maskLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:radius startAngle:2 * M_PI / 3 * (pauseTime   - _startTime) -0.5 * M_PI endAngle:2 * M_PI / 3 * (pauseTime - _startTime + 0.1) -0.5 * M_PI clockwise:YES].CGPath;
    [self.layer addSublayer:maskLayer];
}

- (void)continueAnimation
{
    // 时间转换
    CFTimeInterval pauseTime = _shapeLayer.timeOffset;
    // 计算暂停时间
    CFTimeInterval timeSincePause = CACurrentMediaTime() - pauseTime;
    // 取消
    _shapeLayer.timeOffset = 0;
    // local time相对于parent time世界的beginTime
    _shapeLayer.beginTime = timeSincePause;
    // 继续
    _shapeLayer.speed = 1;
}


#pragma mark - touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_isPlaying) {
        [self runAnimationV1];
        _isPlaying = YES;
    } else {
        [self continueAnimation];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self pauseAnimation];
    [self pauseAndAddMask];
}

#pragma mark - CA AnimtaionDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //anmationForKey ：这样用··
    if(anim == [_shapeLayer animationForKey:@"animationV1"]) {
        _done = YES;
    }
}

@end
