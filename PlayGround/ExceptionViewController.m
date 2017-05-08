//
//  ExceptionViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/1/10.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "ExceptionViewController.h"
#import "AModel.h"

@interface ExceptionViewController ()
@property (nonatomic, assign) NSInteger abc;

@end

@implementation ExceptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSException *testException = [NSException exceptionWithName:@"testName" reason:@"testReason" userInfo:@{@"dick":@"abc"}];
//    @try {
//        @throw testException;
//    } @catch (NSException *exception) {
//        NSLog(@"%@", [exception.userInfo objectForKey:@"dick"]);
//    } @finally {
//        NSLog(@"boom!");
//    }
    
    //gcd won`t lead a crash
    /*
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.abc = 3;
        [strongSelf doSth];
    });*/
    
    __weak typeof(self) weakSelf = self;
    
    AModel *model = [[AModel alloc] init];
    [model doSthWithABlk:^{
        __strong typeof(self) strongSelf = weakSelf;
//        strongSelf.abc = 3 ;
//        [strongSelf doSth];
        self.abc = 3;
        [self doSth];
    }];
    
    // singleton also won`t cause a retain cycle!,as it will release self  until the blk is called.
//    [[AModel sharedObject] doSthWithABlk:^{
//        self.abc;
//    }];
//    
}

- (void)dealloc
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doSth
{
    NSLog(@"abc = %d",self.abc);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
