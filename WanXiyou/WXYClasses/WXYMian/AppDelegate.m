//
//  AppDelegate.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/7/31.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<PKRevealing>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_window setBackgroundColor:[UIColor whiteColor]];
    
    // 读取当前版本
    BOOL isNewVersion = [self isNewVersion];
    
    isNewVersion ? [self enterLoginController] : [self enterDefaultController];
    
    [_window makeKeyAndVisible];
    
    // 监听 loginController 发出的通知
//    [NSNotificationCenter defaultCenter] addObserverForName:<#(nullable NSNotificationName)#> object:<#(nullable id)#> queue:<#(nullable NSOperationQueue *)#> usingBlock:<#^(NSNotification * _Nonnull note)block#>;
    
    return YES;
}

// 判断当前是否为新版本
- (BOOL)isNewVersion {
    // 获取当前app版本号
    NSString *newVersion = [[NSBundle mainBundle] infoDictionary][@"CFBundleVersionString"];
    //加载沙盒中的版本号记录
    NSString *currentVersion = [[NSUserDefaults standardUserDefaults]stringForKey:@"CurrentVersion"];
    //写入新的版本号
    [[NSUserDefaults standardUserDefaults] setObject:newVersion forKey:@"CurrentVersion"];
    
    return newVersion > currentVersion;
}

- (void)enterLoginController {
    
}

- (void)enterDefaultController {
    //左控制器
    WXYLeftMenuController *leftMenuController = [[WXYLeftMenuController alloc] init];
    //Navgation根控制器
    WXYHomeController *homeController = [[WXYHomeController alloc] init];
//    WXYEduController *eduController = [[WXYEduController alloc] init];
    WXYNavigationController *navigationController = [[WXYNavigationController alloc] initWithRootViewController:homeController];
    
    // 设置 PkRevealController 为 window 的根控制器
    PKRevealController *revealController = [PKRevealController revealControllerWithFrontViewController:navigationController leftViewController:leftMenuController];    //遵循代理
    revealController.delegate = self;
    self.window.rootViewController = revealController;
    
}

@end
