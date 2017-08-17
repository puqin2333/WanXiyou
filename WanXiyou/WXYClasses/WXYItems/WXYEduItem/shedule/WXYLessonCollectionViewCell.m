//
//  WXYLessonCollectionViewCell.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYLessonCollectionViewCell.h"

@interface WXYLessonCollectionViewCell ()


@end

@implementation WXYLessonCollectionViewCell


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *lessonLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:11 * kScreenRatio] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:lessonLabel];
        [lessonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView.mas_width);
            make.top.equalTo(self.contentView.mas_top).with.offset(15 * kScreenRatio);
        }];
        
        // 根据 string 对象创建 NSMutableAttributedString
//        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:];
//        //设置段落间的大小
//        NSMutableParagraphStyle *pargraphStyle = [[NSMutableParagraphStyle alloc] init];
//        [pargraphStyle setLineSpacing:3 * kScreenRatio];
//        [pargraphStyle setAlignment:NSTextAlignmentCenter];
//        //对attributedString对象设置间距属性
//        [attributedString addAttribute:NSParagraphStyleAttributeName value:pargraphStyle range:NSMakeRange(0, [attributedString length])];
//        [lessonLabel setAttributedText:attributedString];
        self.lessonLabel = lessonLabel;
        
        UILabel *timeLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:9 * kScreenRatio] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:timeLabel];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView.mas_width);
            make.top.equalTo(lessonLabel.mas_bottom);
        }];
        self.timeLabel = timeLabel;

        
        UILabel *teacherLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:9 * kScreenRatio]textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:teacherLabel];
        [teacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView.mas_width);
            make.top.mas_equalTo(timeLabel.mas_bottom);
        }];
        self.teacherLabel = teacherLabel;
        
        UILabel *classLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:11 * kScreenRatio]textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:classLabel];
        [classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView.mas_width);
            make.top.mas_equalTo(teacherLabel.mas_bottom);
        }];
        
        self.classLabel = classLabel;
    }
    return self;
}

@end
