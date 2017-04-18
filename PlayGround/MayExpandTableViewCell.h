//
//  MayExpandTableViewCell.h
//  PlayGround
//
//  Created by Caotingjun on 2017/4/14.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MayExpandTableViewCell : UITableViewCell

@property (nonatomic, copy) void (^clickToExpandBlk)();

@property (nonatomic, assign) BOOL isExpanded;

+ (instancetype)initFromNib;

@end
