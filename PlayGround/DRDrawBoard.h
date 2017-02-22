//
//  DRDrawBoard.h
//  PlayGround
//
//  Created by Caotingjun on 2016/12/9.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRDrawBoard : UIView

@property (nonatomic, strong) UIColor *penColor;
@property (nonatomic, assign) double strokeWidth;

- (void)replay;
- (void)clear;

@end
