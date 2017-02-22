//
//  PlayWithWindowViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/23.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "PlayWithWindowViewController.h"
#import "DRGlobalMacro.h"
#import "ExcellentWindow.h"

@interface PlayWithWindowViewController ()
{
    BOOL _displayed;
}

@property (nonatomic, strong) UIWindow *window;
@end

@implementation PlayWithWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Flip"
                                   
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(display)];
    self.navigationItem.rightBarButtonItem = flipButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)display
{
    if (_displayed) {
        _displayed = NO;
        [[ExcellentWindow sharedObject] hide];
    } else {
        _displayed = YES;
        [[ExcellentWindow sharedObject] show];
    }
}

- (IBAction)jump:(id)sender {
    UIViewController *aVC = [UIViewController new];
    [self.navigationController pushViewController:aVC animated:YES];
}
@end
