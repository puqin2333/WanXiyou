//
//  WXYPlanView.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYPlanView : UIView

@property(nonatomic, strong) NSArray *dataSource;
@property(nonatomic, strong) UITableView *teamPlanListTableView;
@property(nonatomic, strong) NSArray<UIColor *> *colorArray;

- (void)getColorArray:(NSArray<UIColor *> *)colorArray titleArray:(NSArray *)dataSource;

@end
