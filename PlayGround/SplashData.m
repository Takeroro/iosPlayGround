//
//  SplashData.m
//  PlayGround
//
//  Created by Caotingjun on 2016/12/1.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import "SplashData.h"

@implementation SplashData
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.startTime forKey:@"startTime"];
    [aCoder encodeObject:self.endTime forKey:@"endTime"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.img forKey:@"img"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.startTime = [aDecoder decodeObjectForKey:@"startTime"];
        self.endTime = [aDecoder decodeObjectForKey:@"endTime"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.img = [aDecoder decodeObjectForKey:@"img"];
    }
    return self;
}
@end
