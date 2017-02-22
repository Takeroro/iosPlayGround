//
//  ExcellentWindow.h
//  PlayGround
//
//  Created by Caotingjun on 2016/12/23.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExcellentWindow : UIWindow

+ (instancetype)sharedObject;
- (void)show;
- (void)hide;

@end
