//
//  WXYScoreDetailCell.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/14.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYScoreDetailCell.h"

@implementation WXYScoreDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"scoreDetail";
    WXYScoreDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WXYScoreDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lessonLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Avenir-BlackOblique" size:13] textColor:[UIColor colorWithRed:0.39f green:0.71f blue:0.76f alpha:1.00f] textAlignment:(NSTextAlignmentLeft)];
        [self.contentView addSubview:_lessonLabel];
        
        _characterLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Avenir-BlackOblique" size:12] textColor:[UIColor colorWithRed:0.39f green:0.71f blue:0.76f alpha:1.00f] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_characterLabel];
        
        _scorelabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Avenir-BlackOblique" size:12] textColor:[UIColor colorWithRed:0.39f green:0.71f blue:0.76f alpha:1.00f] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_scorelabel];
        
        _creditLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Avenir-BlackOblique" size:12] textColor:[UIColor colorWithRed:0.39f green:0.71f blue:0.76f alpha:1.00f] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_creditLabel];
        
        _ponitLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Avenir-BlackOblique" size:12] textColor:[UIColor colorWithRed:0.39f green:0.71f blue:0.76f alpha:1.00f] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_ponitLabel];
    }
    [self configurecommonUI];
    return self;
}

- (void)configurecommonUI {
    
    [_lessonLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top .equalTo(self.contentView.mas_top).with.offset(10);
        make.width.mas_equalTo(CGRectGetWidth(self.frame)*0.3);
        make.height.mas_equalTo(kScreenRatio * 40);
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
    }];
    
    [_characterLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top .equalTo(self.contentView.mas_top).with.offset(10);
        make.left.equalTo(_lessonLabel.mas_right).with.offset(CGRectGetWidth(self.frame)*0.1);
        make.width.mas_equalTo(CGRectGetWidth(self.frame)*0.35);
        make.height.mas_equalTo(kScreenRatio * 40);
    }];
    
    [_scorelabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top .equalTo(self.lessonLabel.mas_bottom).with.offset(10 * kScreenRatio);
        make.width.mas_equalTo(CGRectGetWidth(self.frame)*0.25);
        make.height.mas_equalTo(kScreenRatio * 30);
        make.leading.equalTo(@(20 * kScreenRatio));
    }];
    
    [_creditLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top .equalTo(self.lessonLabel.mas_bottom).with.offset(10 * kScreenRatio);
        make.left.equalTo(self.scorelabel.mas_right).with.offset(CGRectGetWidth(self.frame)*0.1);
        make.width.mas_equalTo(CGRectGetWidth(self.frame)*0.2);
        make.height.mas_equalTo(kScreenRatio * 30);
    }];
    
    [_ponitLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top .equalTo(self.lessonLabel.mas_bottom).with.offset(10 * kScreenRatio);
        make.left.equalTo(self.creditLabel.mas_right).with.offset(CGRectGetWidth(self.frame)*0.1);
        make.width.mas_equalTo(CGRectGetWidth(self.frame)*0.2);
        make.height.mas_equalTo(kScreenRatio * 30);
    }];
}

@end
