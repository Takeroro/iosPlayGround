//
//  AModel.h
//  PlayGround
//
//  Created by Terrence on 2017/4/29.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AModel : NSObject

+ (instancetype)sharedObject;

- (void)doSthWithABlk:(void(^)())blk;

@end
