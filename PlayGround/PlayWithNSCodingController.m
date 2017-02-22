//
//  PlayWithNSCodingController.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/1.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "PlayWithNSCodingController.h"
#import "SplashData.h"

@implementation PlayWithNSCodingController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //归档
    SplashData *splash = [[SplashData alloc] init];
    splash.startTime = [NSDate date];
    splash.url = [NSURL URLWithString:@"www.baidu.com"];
    splash.img = [UIImage imageNamed:@"chat_send_nor"];
    NSData *archiverData = [NSKeyedArchiver archivedDataWithRootObject:splash];
    [[NSUserDefaults standardUserDefaults] setObject:archiverData forKey:@"splash"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //解档
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"splash"];
    SplashData *splash = [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
@end
