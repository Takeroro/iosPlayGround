//
//  NSObject+RT.m
//  PlayGround
//
//  Created by Caotingjun on 2017/3/21.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "NSObject+RT.h"
#import <objc/runtime.h>
#import "StubHandleManager.h"

@implementation NSObject (RT)
+ (void)load
{
    
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
//    NSString *methodName = NSStringFromSelector(sel);
//    if ([methodName isEqualToString:@"btnTestCrash"]) {
//        class_addMethod([self class], sel, (IMP)myMethod,"v@:");
//        return YES;
//    }
    return YES;
}

int myMethod(id self, SEL _cmd) {
//    NSLog(@"fuck");
    return 0;
}

//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    id stub = [self newAClassAtRunTimeWithClassName:@"errorHandle" withSelector:aSelector];
//
//    return stub;
//}

int test() {
    NSLog(@"test crash");   
    return 0;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"哈哈哈哈：%@", NSStringFromSelector(aSelector));
}

- (void)xxx_doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"哈哈哈哈1：%@", NSStringFromSelector(aSelector));
}

/*
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [NSMethodSignature signatureWithObjCTypes:"i@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //改变reciver 及 selector
    [anInvocation setSelector:@selector(handle)];
    //    [anInvocation setTarget:[StubHandleManager new]];
    [anInvocation invokeWithTarget:[StubHandleManager new]];
}
*/

+ (Class)newAClassAtRunTimeWithClassName:(NSString *)clsName
{
    Class newClass = NSClassFromString(clsName);
    
    if(newClass == nil)
    {
        newClass = objc_allocateClassPair([NSObject class], [clsName UTF8String], 0);

        objc_registerClassPair(newClass);
    }
    return newClass;
}

int testHandle() {
    NSLog(@"handled");
    return 0;
}


@end
