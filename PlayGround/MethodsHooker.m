//
//  MethodsHooker.m
//  yyfe
//
//  Created by linzhiman on 16/11/25.
//  Copyright © 2016年 yy.com. All rights reserved.
//

#import "MethodsHooker.h"
#import <objc/runtime.h>

@implementation MethodsHooker

+ (void)hookMayCrashMethod
{
//    [self hookAddSubview];
//    [self testHook];
}

+ (void)hookAddSubview
{
    [self hookMethodClass:[UIView class]
                  hookSEL:@selector(addSubview:)
              originalSEL:@selector(addSubviewOriginal:)
                myselfSEL:@selector(addSubviewMySelf:)];
}

+ (void)testHook
{
    [self hookMethodClass:[NSObject class] hookSEL:@selector(resolveInstanceMethod:) originalSEL:@selector(resolveInstanceMethodOriginal:) myselfSEL:@selector(resolveInstanceMethodMySelf:)];
}

- (void)addSubviewMySelf:(UIView *)view
{
    NSLog(@"hook");
    if (self != (id)view) {
        [self addSubviewOriginal:view];
    }
    else {
#if DEBGU
        [self addSubviewOriginal:view];
#endif
    }
}

- (void)addSubviewOriginal:(UIView *)view
{
}


+ (void)hookMethodClass:(Class)class hookSEL:(SEL)hookSEL originalSEL:(SEL)originalSEL myselfSEL:(SEL)mySelfSEL
{
    Method hookMethod = class_getInstanceMethod(class, hookSEL);
    Method mySelfMethod = class_getInstanceMethod(self, mySelfSEL);
    
    IMP hookMethodIMP = method_getImplementation(hookMethod);
    class_addMethod(class, originalSEL, hookMethodIMP, method_getTypeEncoding(hookMethod));
    
    IMP hookMethodMySelfIMP = method_getImplementation(mySelfMethod);
    class_replaceMethod(class, hookSEL, hookMethodMySelfIMP, method_getTypeEncoding(hookMethod));
}



@end
