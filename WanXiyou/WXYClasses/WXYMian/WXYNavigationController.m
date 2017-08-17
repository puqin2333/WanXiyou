//
//  WXYNavigationController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/7/31.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYNavigationController.h"

@interface WXYNavigationController ()

@end

@implementation WXYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 关闭高斯模糊
    [UINavigationBar appearance].translucent = NO;
    // 关闭自动下移
    self.automaticallyAdjustsScrollViewInsets = false;
    
    //去除导航栏上返回按钮的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:93 / 255.0 green:201 / 255.0 blue:241 / 255.0 alpha:1]];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor colorWithRed:74 / 255.0 green:74 / 255.0 blue:74 / 255.0 alpha:1],
                          NSFontAttributeName:[UIFont systemFontOfSize:17.f]};
    [[UINavigationBar appearance] setTitleTextAttributes:dic];
    
    //设置 UINavgationBar 的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:93.0/255.0 green:188.0/255.0 blue:208.0/255.0 alpha:1]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
