//
//  MayExpandTableViewCell.m
//  PlayGround
//
//  Created by Caotingjun on 2017/4/14.
//  Copyright © 2017年 Caotingjun. All rights reserved.
//

#import "MayExpandTableViewCell.h"
@interface MayExpandTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *expandBtn;

@end
@implementation MayExpandTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame"];
}

+ (instancetype)initFromNib
{
    return [[NSBundle mainBundle] loadNibNamed:[MayExpandTableViewCell description] owner:nil options:nil].firstObject;
}

- (IBAction)onExpandBtnClicked:(id)sender {
    if (self.clickToExpandBlk) {
        self.clickToExpandBlk();
    }
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    CGRect frame = [change[NSKeyValueChangeNewKey] CGRectValue];
    if (frame.size.height > 80) {
        [self.expandBtn setTitle:@"缩合" forState:UIControlStateNormal];
    } else {
        [self.expandBtn setTitle:@"展开" forState:UIControlStateNormal];
    }
}

@end
