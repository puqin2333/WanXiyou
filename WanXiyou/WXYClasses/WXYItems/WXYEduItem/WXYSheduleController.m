//
//  WXYSheduleController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYSheduleController.h"
#import "WXYWeekView.h"
@interface WXYSheduleController ()
@property(nonatomic, strong) WXYWeekView *weekView;
@end

@implementation WXYSheduleController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _weekView = [[WXYWeekView alloc] initWithFrame:CGRectMake(0, 50 * kScreenRatio, kScreenWidht, kScreenHeight - 50 * kScreenRatio)];
    [self.view addSubview:_weekView];

}



@end
