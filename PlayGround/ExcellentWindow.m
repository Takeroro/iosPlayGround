//
//  ExcellentWindow.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/23.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "ExcellentWindow.h"

@implementation ExcellentWindow

+ (instancetype)sharedObject
{
    static dispatch_once_t onceToken;
    static ExcellentWindow *windowInstance = nil;
    dispatch_once(&onceToken, ^{
        windowInstance = [[ExcellentWindow alloc] initWithFrame:CGRectMake(0, 64, DRScreenWidth, DRScreenHeight - 64)];
    });
    return windowInstance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *redSqr = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        redSqr.backgroundColor = [UIColor redColor];
        [self addSubview:redSqr];
    }
    return self;
}

- (void)show {
    [self makeKeyAndVisible];   
    self.alpha = 1;
}

- (void)hide {
    [self resignKeyWindow];
    self.alpha = 0;
}

@end
