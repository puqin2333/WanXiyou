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
    
    //读取当前网络状态
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 读取当前版本
//    BOOL isNewVersion = [self isNewVersion];
//    
//    isNewVersion ? [self enterLoginController] : [self enterDefaultController];
    [self enterLoginController];
//
    [self.window makeKeyAndVisible];
    
//  监听 loginController 发出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeView:) name:@"changeToMainVC" object:nil];
    
    return YES;
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    WXYLoginViewController *loginViewController = [[WXYLoginViewController alloc] init];
    self.window.rootViewController = loginViewController;
}

- (void)enterDefaultController {
    //左控制器
    WXYLeftMenuController *leftMenuController = [[WXYLeftMenuController alloc] init];
    //Navgation根控制器
    WXYHomeController *homeController = [[WXYHomeController alloc] init];
    WXYEduController *eduController = [[WXYEduController alloc] init];
    [homeController showDetailViewController:eduController];
    WXYNavigationController *navigationController = [[WXYNavigationController alloc] initWithRootViewController:homeController];
    
    // 设置 PkRevealController 为 window 的根控制器
    PKRevealController *revealController = [PKRevealController revealControllerWithFrontViewController:navigationController leftViewController:leftMenuController];    //遵循代理
    revealController.delegate = self;
    self.window.rootViewController = revealController;
    
}

- (void)changeView:(NSNotification *)notification {
    NSDictionary *passValue = [notification userInfo];
    NSLog(@"%@",passValue);
    NSDictionary *data = passValue[@"data"];
    self.paramDict = @{
                       @"xh" : data[@"id"],
                       @"name" : data[@"name"],
                       @"cookie" : data[@"cookie"],
                       @"device" : @"iOS"
                       };
    NSLog(@"%@",self.paramDict);
    
    [self enterDefaultController];
}

@end
