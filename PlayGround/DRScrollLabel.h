//
//  DRScrollLabel.h
//  PlayGround
//
//  Created by Caotingjun on 2017/4/6.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRScrollLabel : UIView<CAAnimationDelegate>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;

- (void)startAnimation;

@end
