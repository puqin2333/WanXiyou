//
//  WXYRunViewController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/16.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYRunViewController.h"

@interface WXYRunViewController ()

@property(nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation WXYRunViewController

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:0];
    
    WXYRuningController *runingController = [[WXYRuningController alloc] init];
    WXYDataStatusController *dataStatusController = [[WXYDataStatusController alloc] init];
    NSArray *controllerArray = @[runingController,dataStatusController];
    
    NSArray *titleArray = @[@"跑步",@"数据统计"];
    for (int i = 0;i < 2;i++) {
        [self.dataSource addObject:controllerArray[i]];
        [titles addObject:titleArray[i]];
    }
    
    CGRect frame = self.view.frame;
    LDSegmentViewController *segmentVC = [[LDSegmentViewController alloc] init];
    segmentVC.viewControllers = self.dataSource;
    segmentVC.segmentTitles = titles;
    segmentVC.view.frame = frame;
    segmentVC.selectedIndex = 0;
    [self addChildViewController:segmentVC];
    [self.view addSubview:segmentVC.view];
    
}



@end
