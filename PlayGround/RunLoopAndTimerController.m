//
//  RunLoopAndTimerController.m
//  PlayGround
//
//  Created by Caotingjun on 16/11/14.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "RunLoopAndTimerController.h"


@interface holyShitOBj : NSObject
@property (nonatomic, strong) NSString *name;
+ (instancetype)initFromX;

+ (instancetype)new;

@end

@implementation holyShitOBj

+ (instancetype)initFromX
{
    return [[holyShitOBj alloc]init];
}

+ (instancetype)new
{
    return [[holyShitOBj alloc]init];
}

- (void)dealloc
{
    NSLog(@"holy shit object release!");
}

@end

@interface RunLoopAndTimerController ()

@end

@implementation RunLoopAndTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunLoop & Timer";
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//    }];
//    [NSRunLoop currentRunLoop] addTimer:<#(nonnull NSTimer *)#> forMode:<#(nonnull NSRunLoopMode)#>
    {
    holyShitOBj *objNew = [holyShitOBj new];
    objNew.name = @"123";
    }
    {
    holyShitOBj *objNonNew = [holyShitOBj initFromX];
    objNonNew.name = @"456";
    }
    {
        holyShitOBj *objNew1 = [holyShitOBj new];
        objNew1.name = @"123";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)newAObject
{
    holyShitOBj *newOne = [holyShitOBj new];
    newOne.name = @"123";
}

- (void)createAObject
{
    holyShitOBj *nonNewOne = [holyShitOBj initFromX];
    
}
@end
