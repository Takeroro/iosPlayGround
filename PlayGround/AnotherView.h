//
//  AnotherView.h
//  PlayGround
//
//  Created by Caotingjun on 2017/4/12.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnotherView : UIView

+ (instancetype)sharedObject;

@property (nonatomic, strong) UIView *ownedView;

@property (nonatomic, weak) UIView *unOwnedView;

@end
