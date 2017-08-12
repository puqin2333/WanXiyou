//
//  WXYScoreStatusCell.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/5.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYScoreStatusCell.h"

@implementation WXYScoreStatusCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.scoreLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:15 * kScreenRatio] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self addSubview:_scoreLabel];
        _scoreLabel.frame = self.frame;
    }
    return self;
}
@end
