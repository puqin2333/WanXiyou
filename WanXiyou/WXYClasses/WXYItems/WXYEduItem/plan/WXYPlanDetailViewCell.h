//
//  WXYPlanDetailViewCell.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYPlanDetailViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *lessonLabel; // 课程名称
@property(nonatomic, strong) UILabel *characterLabel; // 课程性质
@property(nonatomic, strong) UILabel *timeLabel; // 起始结束周
@property(nonatomic, strong) UILabel *creditLabel; //  学分
@property(nonatomic ,strong) UILabel *examWayLabel; // 考核方式

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
