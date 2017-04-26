//
//  ExpandableCellView.h
//  PlayGround
//
//  Created by Terrence on 2017/4/27.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ExpandableCellViewDelegate<NSObject>
@optional -(void)expandableViewStateChange:(BOOL)isExpand;
@end
@interface ExpandableCellView : UIView
@property (nonatomic, weak) id<ExpandableCellViewDelegate> delegate;
- (void)setString:(NSString *)str
  withLabelHeight:(CGFloat)labelHeight
        btnHeight:(CGFloat)btnHeight;

@end
