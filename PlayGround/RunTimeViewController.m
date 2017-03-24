//
//  RunTimeViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/3/21.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "RunTimeViewController.h"
#import "StubHandleManager.h"
#import <Masonry.h>
#import <objc/runtime.h>
#import "NSObject+RT.h"

@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

#pragma mark - method swizlling

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initTestCrashBtn];
    
    [self initNormalBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)xxx_viewWillAppear:(BOOL)animated
{
    [self xxx_viewWillAppear:animated];
    NSLog(@"xxx_viewWillAppear");
    int y =   (int)[self performSelector:@selector(abc) withObject:@(3)];
    NSLog(@"y= %d",y);
}

- (void)initTestCrashBtn
{
    UIButton *btnTestCrash = [[UIButton alloc] init];
    [self.view addSubview:btnTestCrash];
    [btnTestCrash mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.topMargin.equalTo(self.view).offset(100);
    }];
    [btnTestCrash setTitle:@"test Crash" forState:UIControlStateNormal];
    [btnTestCrash setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnTestCrash addTarget:self action:@selector(btnTestCrash) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initNormalBtn
{
    UIButton *normalBtn = [[UIButton alloc] init];
    [self.view addSubview:normalBtn];
    [normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.topMargin.equalTo(self.view).offset(200);
    }];
    [normalBtn setTitle:@"normal" forState:UIControlStateNormal];
    [normalBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [normalBtn addTarget:self action:@selector(tick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tick
{
    NSLog(@"tick");
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSString *methodName = NSStringFromSelector(sel);
//    if ([methodName isEqualToString:@"btnTestCrash"]) {
//        class_addMethod([self class], sel, (IMP)myMethod1,"v@:");
//        return YES;
//    }
//    //class_addmethod
//    //参数1：给谁添加
//    //参数2：添加的selector
//    //参数3：添加的imp实现
//    //参数4："v@:"方法的签名，代表没有参数的方法。
//    return [super resolveInstanceMethod:sel];
//}
//
//int myMethod1(id self, SEL _cmd) {
//    NSLog(@"我被调用了111");
//    return 0;
//}


#pragma mark - 完整forwardInvocation 消息转发
/*
//先搞签名，为nil则不转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(btnTestCrash)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    //改变reciver 及 selector
    [anInvocation setSelector:@selector(handle1)];
//    [anInvocation setTarget:[StubHandleManager new]];
    [anInvocation invokeWithTarget:[StubHandleManager new]];
}
*/

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    //only create a class like coding in files
    Class Stub = [[NSObject  newAClassAtRunTimeWithClassName:@"errorHandle"] class];
    
    //we need to initailize this class
    id instance = [[Stub alloc] init];
    
    //addMethod for our dear aSelector
    class_addMethod([Stub class], aSelector, (IMP)testHandleWithArgs, "i@:@");

    //introspect the class 
    unsigned int mCount = 0;
    Method *methods = class_copyMethodList([Stub class], &mCount);
    NSLog(@"method count = %d", mCount);
    for (NSInteger i = 0; i < mCount; i++) {
        NSString *methodName = NSStringFromSelector(method_getName(methods[i]));
        IMP test = method_getImplementation(methods[i]);
        NSLog(@"methodName = %@",methodName);
    }
    
    return instance;
}

int testHandle1(id self, SEL _cmd) {
    return 0;
}

int testHandleWithArgs(id self, SEL _cmd, id x) {
    int y = [(NSNumber *)x intValue] + 3;
    return y;
}
@end
