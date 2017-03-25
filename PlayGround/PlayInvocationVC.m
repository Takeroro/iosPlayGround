//
//  PlayInvocationVC.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/21.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "PlayInvocationVC.h"

@interface PlayInvocationVC ()

@end

@implementation PlayInvocationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMethodSignature *methodSign = [self methodSignatureForSelector:@selector(fuckUWithDick:AndToes:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
    invocation.target = self;
    invocation.selector = @selector(fuckUWithDick:AndToes:);
    
    NSUInteger argumentCount = methodSign.numberOfArguments;
    NSString*number = @"1111";
    for (int i = 0; i < argumentCount - 2; i++) {
        [invocation setArgument:&number atIndex:i+2];
    }
    //call the method
    [invocation invoke];
    
    //TODO:set the return type if needed
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fuckUWithDick:(NSString *)dick AndToes:(NSString *)toes
{
    NSLog(@"fuckWithDick:%@,%@",dick,toes);
    
}

#pragma mark - figure out [self class]
+ (void)doSthInClassMethod
{
//类方法无法调用实例方法
//    will crash
//    'NSInvalidArgumentException', reason: '+[PlayInvocationVC doSthInInstantMethod]: unrecognized selector sent to class
    
//    [[self class] doSthInInstantMethod];
}

- (void)doSthInInstantMethod
{
    //加上 [self class] 可调用类方法；
    [[self class] doSthInClassMethod];
}
@end
