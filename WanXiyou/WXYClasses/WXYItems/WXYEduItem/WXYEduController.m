//
//  WXYEduController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/7/31.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYEduController.h"

@interface WXYEduController ()

@property(nonatomic, strong) NSMutableArray *dataSource;
@property(nonatomic, strong) WXYEduPresenters *presenter;

@end

@implementation WXYEduController

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self getModel];
    
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:0];
    WXYSheduleController *sheduleController = [[WXYSheduleController alloc] init];
    WXYScoreController *scoreController = [[WXYScoreController alloc] init];
    WXYStatsController *statsController = [[WXYStatsController alloc] init];
    WXYPlanController *planController = [[WXYPlanController alloc] init];
    
    NSArray *controllerArray = @[sheduleController,scoreController,statsController,planController];
    NSArray *titleArray = @[@"我的课表",@"我的成绩",@"成绩统计",@"培养计划"];
    for (int i = 0; i < 4; i++) {
        [self.dataSource addObject:controllerArray[i]];
        [titles addObject:titleArray[i]];
    }
    
    CGRect frame = self.view.frame;

    LDSegmentViewController *segmentVC = [[LDSegmentViewController alloc]init];
    segmentVC.viewControllers = self.dataSource;
    segmentVC.segmentTitles = titles;
    segmentVC.view.frame = frame;
    segmentVC.selectedIndex = 0;
    [self addChildViewController:segmentVC];
    [self.view addSubview:segmentVC.view];
}

- (void)getModel {
    
    __block NSDictionary *lessonDict = [NSDictionary dictionary];
    self.presenter = [[WXYEduPresenters alloc] init];
    [self.presenter requestLessonList:^(NSDictionary *result) {
        lessonDict = result;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getModel" object:nil userInfo:result];
    }];
}


@end
