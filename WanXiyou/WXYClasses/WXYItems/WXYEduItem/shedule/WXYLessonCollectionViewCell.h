//
//  WXYLessonCollectionViewCell.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYLessonCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) UILabel *lessonLabel;
@property(nonatomic, strong) UILabel *teacherLabel;
@property(nonatomic, strong) UILabel *classLabel;
@property(nonatomic, strong) NSString *lesson;
@property(nonatomic, strong) NSString *teacher;
@property(nonatomic, strong) NSString *classNumber;

@end
