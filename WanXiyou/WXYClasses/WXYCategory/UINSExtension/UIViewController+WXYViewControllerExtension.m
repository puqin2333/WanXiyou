//
//  UIViewController+WXYViewControllerExtension.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/16.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "UIViewController+WXYViewControllerExtension.h"

@implementation UIViewController (WXYViewControllerExtension)

+ (void)pushViewControllerByNavigationVCInRevealVCFront:(UIViewController *)vc {
    // 根控制器
    PKRevealController *revealController = (PKRevealController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    // 弹出主界面控制器
    [revealController showViewController:revealController.frontViewController animated:YES completion:^(BOOL finished) {
        // 获取主界面控制器的 NavigationVC
        UINavigationController *naviVC = (UINavigationController *)revealController.frontViewController;
        // push 新创建的 VC
        [naviVC pushViewController:vc animated:YES];
    }];
}

+ (void)changeViewControllerByNavigationVCInRevealVCFront:(UIViewController *)vc {

    PKRevealController *revealController = (PKRevealController *)[UIApplication sharedApplication].keyWindow.rootViewController;

    
    WXYHomeController *homeController = [[WXYHomeController alloc] init];
    [homeController showDetailViewController:vc];
    WXYNavigationController *navigationController = [[WXYNavigationController alloc] initWithRootViewController:homeController];

    revealController.frontViewController = navigationController;
}

@end
