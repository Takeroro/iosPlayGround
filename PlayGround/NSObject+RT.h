//
//  NSObject+RT.h
//  PlayGround
//
//  Created by Caotingjun on 2017/3/21.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RT)

+ (Class)newAClassAtRunTimeWithClassName:(NSString *)clsName;

@end
