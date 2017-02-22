//
//  ExceptionViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2017/1/10.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "ExceptionViewController.h"

@interface ExceptionViewController ()

@end

@implementation ExceptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSException *testException = [NSException exceptionWithName:@"testName" reason:@"testReason" userInfo:@{@"dick":@"abc"}];
    @try {
        @throw testException;
    } @catch (NSException *exception) {
        NSLog(@"%@", [exception.userInfo objectForKey:@"dick"]);
    } @finally {
        NSLog(@"boom!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
