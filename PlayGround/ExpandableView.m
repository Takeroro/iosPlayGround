//
//  ExpandableView.m
//  yyfe
//
//  Created by Caotingjun on 2017/4/18.
//  Copyright © 2017年 yy.com. All rights reserved.
//

#import "ExpandableView.h"
#import <Masonry.h>
//#import "UIView+Geometry.h"
//#import "NSString+Addition.h"
@interface ExpandableView()
{
    UILabel *_label;
    UIButton *_expandBtn;
    NSString *_willExpandLabelContent;
    
    BOOL _isExpanded;
}

@end
@implementation ExpandableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)initLabel
{
    _label = [UILabel new];
//    _willExpandLabelContent = [self.attributedString.string getStringWithLineNum:3 font:_label.font width:self.width];
//    CGSize willExpandLabelSize = [_willExpandLabelContent safeSizeWithFont:_label.font];
//    _label.frame = CGRectMake(0, 0, self.width, willExpandLabelSize.height);
    _label.text = _willExpandLabelContent;
    [self addSubview:_label];
}

- (void)initExpandBtn
{
    if ([_willExpandLabelContent isEqualToString:self.attributedString.string]) {
        return;
    }
//    _expandBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _label.bottom, 50, 50)];
//    _expandBtn setTitle:<#(nullable NSString *)#> forState:<#(UIControlState)#>
}


@end
