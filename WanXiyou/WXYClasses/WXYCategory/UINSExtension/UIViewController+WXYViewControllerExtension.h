//
//  UIViewController+WXYViewControllerExtension.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/16.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WXYViewControllerExtension)

+ (void)pushViewControllerByNavigationVCInRevealVCFront:(UIViewController *)vc;
+ (void)changeViewControllerByNavigationVCInRevealVCFront:(UIViewController *)vc ;
@end
