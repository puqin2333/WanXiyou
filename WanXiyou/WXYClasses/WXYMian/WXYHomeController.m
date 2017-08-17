//
//  WXYHomeController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/7/31.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYHomeController.h"

@interface WXYHomeController ()

@property(nonatomic, strong) UIView *customView;

@end

@implementation WXYHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:93.0/255.0 green:188.0/255.0 blue:208.0/255.0 alpha:1];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self customView]];
    [self.navigationItem.leftBarButtonItem setAction:@selector(presentLeftMenuViewController:)];
    
}

- (void)showDetailViewController:(UIViewController *)vc {
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
}
// 自定义leftBarButtonItem
- (UIView *)customView {
    if (_customView == nil) {
        //自定义leftBarButtonItem
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 60)];
        UIButton *leftMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [view addSubview:leftMenuBtn];
        [leftMenuBtn mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(view.mas_left).with.offset(10);
            make.top.mas_equalTo(20);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(25);
        }];
        [leftMenuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [leftMenuBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *titleLabel = [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Courier New" size:16] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
        [view addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(leftMenuBtn.mas_right).with.offset(25);
            make.top.mas_equalTo(20);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(25);
        }];
        titleLabel.text = @"玩西邮";
        
        self.customView = view;
    }
    return _customView;
}

- (void)presentLeftMenuViewController:(UIBarButtonItem *)leftBarButtonItem{
    
    PKRevealController *revealController = (PKRevealController *) [UIApplication sharedApplication].keyWindow.rootViewController;
    [revealController showViewController:revealController.leftViewController animated:YES completion:^(BOOL finished) {
    }];
}


@end
