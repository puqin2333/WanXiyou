//
//  WXYLoginViewController.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/7.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WXYLoginPresenter;

@interface WXYLoginViewController : UIViewController

@property(nonatomic, strong) UIImageView *securityCodeView; // 验证码
@property(nonatomic, strong) WXYLoginPresenter *presenter;


@end
