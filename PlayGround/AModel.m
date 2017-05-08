//
//  AModel.m
//  PlayGround
//
//  Created by Terrence on 2017/4/29.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "AModel.h"
@interface AModel()

@end
@implementation AModel

+ (instancetype)sharedObject
{
    static dispatch_once_t onceToken;
    static AModel *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[AModel alloc] init];
    });
    return instance;
}

- (void)doSthWithABlk:(void(^)())blk
{
    [self performSelector:@selector(delayShoot:) withObject:blk afterDelay:3];
}

- (void)delayShoot:(void(^)())blk
{
    blk();
}

- (void)dealloc
{
    
}

@end
