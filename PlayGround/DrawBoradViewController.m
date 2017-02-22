//
//  DrawBoradViewController.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/9.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "DrawBoradViewController.h"
#import "DRDrawBoard.h"

@interface DrawBoradViewController ()
@property (weak, nonatomic) IBOutlet DRDrawBoard *mDrawBoard;

@end

@implementation DrawBoradViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _mDrawBoard.penColor = [UIColor blackColor];
    _mDrawBoard.strokeWidth = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)replay:(id)sender {
}


- (IBAction)clear:(id)sender {
}

@end
