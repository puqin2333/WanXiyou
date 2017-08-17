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
        UILabel *scoreLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:15 * kScreenRatio] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:scoreLabel];
        [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@(5));
            make.top.equalTo(@(5));
            make.trailing.equalTo(@(-5));
            make.bottom.equalTo(@(-5));
        }];
        self.scoreLabel = scoreLabel;
    }
    return self;
}
@end
