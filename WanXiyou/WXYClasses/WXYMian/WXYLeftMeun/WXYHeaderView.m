//
//  WXYHeaderView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYHeaderView.h"

@implementation WXYHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
        [self setHeadPortrait];
    }
    return self;
}

- (void)setView {
    
    //背景图
    _backgroundImageView = [[UIImageView alloc] initWithFrame:self.frame];
//    _backgroundImageView.image = [UIImage imageNamed:@"mybackground-1"];
    _backgroundImageView.backgroundColor = [UIColor colorWithRed:93.0/255.0 green:188.0/255.0 blue:208.0/255.0 alpha:1];
    [self addSubview:_backgroundImageView];
    
    //头像
    _headPortraitImageView = [[UIImageView alloc] init];
    [self addSubview:_headPortraitImageView];
    [_headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kScreenRatio * 30);
        make.width.height.mas_equalTo(kScreenRatio * 60);
        make.centerY.mas_equalTo(self.mas_centerY).with.offset(- kScreenRatio * 10);
    }];
    _headPortraitImageView.image = [UIImage imageNamed:@"image"];
    
    
    //个人信息 -- 姓名
    _nameLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Courier New" size:13] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(_headPortraitImageView.mas_left);
        make.top.equalTo(_headPortraitImageView.mas_bottom).with.offset(kScreenRatio * 10);
        make.height.mas_equalTo(kScreenRatio * 25);
        make.width.mas_equalTo(kScreenRatio * 60);
    }];

    // 班级
    _classLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Courier New" size:12] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    [self addSubview:_classLabel];
    [_classLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_nameLabel.mas_bottom);
        make.left.equalTo(_nameLabel.mas_left);
        make.height.mas_equalTo(kScreenRatio * 20);
        make.width.mas_equalTo(kScreenRatio * 100);
    }];

    // 假数据
    _nameLabel.text = @"陈一鸣";
    _classLabel.text = @"计科 1501 班";
    
}

// 设置头像
- (void)setHeadPortrait {
    // 把头像设置为圆形
    _headPortraitImageView.layer.cornerRadius = kScreenRatio * 30;
    _headPortraitImageView.layer.masksToBounds = YES;
    //给头像加一个圆形边框
    _headPortraitImageView.layer.borderWidth = 1.0f * kScreenRatio;
    _headPortraitImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _headPortraitImageView.userInteractionEnabled = YES;
    
}

@end
