//
//  AnotherView.m
//  PlayGround
//
//  Created by Caotingjun on 2017/4/12.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "AnotherView.h"

@implementation AnotherView

+(instancetype)sharedObject
{
    static dispatch_once_t onceToken;
    static AnotherView *_instance = nil;
    dispatch_once(&onceToken, ^{
        _instance = [[AnotherView alloc] init];
    });
    return _instance;
}

-(void)dealloc
{
    
}

@end
