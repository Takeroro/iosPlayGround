//
//  SplashData.h
//  PlayGround
//
//  Created by Caotingjun on 2016/12/1.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SplashData : NSObject<NSCoding>
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSDate *endTime;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) UIImage *img;
@end
