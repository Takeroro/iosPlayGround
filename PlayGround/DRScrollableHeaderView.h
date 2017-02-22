//
//  DRScrollableHeaderView.h
//  PlayGround
//
//  Created by Caotingjun on 16/10/28.
//  Copyright © 2016年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DRScrollHeaderDelegate <NSObject>
@required
- (void)pageMoveFrom:(NSInteger)fromIndex to:(NSInteger)toIndex;

@end

@interface DRScrollableHeaderView : UIView

@property (nonatomic, weak) id<DRScrollHeaderDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                        array:(NSArray *)array
                     delegate:(id<DRScrollHeaderDelegate>)delegate;

- (instancetype)initWithArray:(NSArray *)array
                     delegate:(id<DRScrollHeaderDelegate>) delegate;

@end
