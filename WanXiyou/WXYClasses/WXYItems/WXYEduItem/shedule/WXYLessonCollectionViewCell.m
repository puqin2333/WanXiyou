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
        UILabel *lessonLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:8 * kScreenRatio] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:lessonLabel];
        [lessonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView.mas_width);
            make.top.equalTo(self.contentView.mas_top).with.offset(10 * kScreenRatio);
        }];
        lessonLabel.text = _lesson;
                                
        // 根据 string 对象创建 NSMutableAttributedString
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_lesson];
        //设置段落间的大小
        NSMutableParagraphStyle *pargraphStyle = [[NSMutableParagraphStyle alloc] init];
        [pargraphStyle setLineSpacing:3 * kScreenRatio];
        [pargraphStyle setAlignment:NSTextAlignmentCenter];
        //对attributedString对象设置间距属性
        [attributedString addAttribute:NSParagraphStyleAttributeName value:pargraphStyle range:NSMakeRange(0, [attributedString length])];
        [lessonLabel setAttributedText:attributedString];
        self.lessonLabel = lessonLabel;
        
        UILabel *teacherLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:8 * kScreenRatio]textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:teacherLabel];
        [teacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView.mas_width);
            make.top.mas_equalTo(lessonLabel.mas_bottom).with.offset(5 * kScreenRatio);
        }];
//        teacherLabel.text = _teacher;
        self.teacherLabel = teacherLabel;
        
        
        UILabel *classLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"IowanOldStyle-Italic" size:8 * kScreenRatio]textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:classLabel];
        [classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.teacherLabel.mas_width);
            make.top.mas_equalTo(teacherLabel.mas_bottom).with.offset(5 * kScreenRatio);
        }];
//        classLabel.text = _classNumber;
        self.classLabel = classLabel;
        self.contentView.layer.cornerRadius = 20 * kScreenRatio;
    }
    return self;
}


- (void)initModel {
    
//    self.lesson = @"马克思主义基本原理概论";
//    self.teacher = @"@核弹头";
//    self.classNumber = @"FZ155";
    __block NSDictionary *lessonModel = [NSDictionary dictionary];
    WXYEduPresenters *presenter = [[WXYEduPresenters alloc] init];
    [presenter requestLessonList:^(NSDictionary *result) {
        lessonModel = result;
    }];
    
}

@end
