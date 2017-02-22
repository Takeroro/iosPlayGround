//
//  BlankView.m
//  PlayGround
//
//  Created by Caotingjun on 2017/2/10.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "BlankView.h"

@implementation BlankView

+ (instancetype)initFromNib
{
    return [[[NSBundle mainBundle] loadNibNamed:@"BlankView" owner:nil options:nil] firstObject];
}


@end
