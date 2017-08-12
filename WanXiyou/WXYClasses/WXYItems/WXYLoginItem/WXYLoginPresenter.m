//
//  WXYLoginPresenter.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/8.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYLoginPresenter.h"

@interface WXYLoginPresenter ()

@property(nonatomic,strong) WXYLoginModel *loginModel;

@end


@implementation WXYLoginPresenter

- (instancetype)init{
    self = [super init];
    if (self) {
        //持有M层的引用
        _loginModel = [WXYLoginModel shareInstance];
    }
    return self;
}

// 向view传model请求的验证码
- (void)requestsecurityCode:(Callback) callback {
    [_loginModel getResultback:^(NSDictionary *result) {
        NSDictionary *dict = result;
        callback(dict);
    }];
}

// 向view传model请求的用户数据
- (void)loginWithUsername:(NSString *)username password:(NSString *)password securityCode:(NSString *)securityCode cookie:(NSString *)cookie callback:(Callback)callback{
    NSDictionary *userInfoDict  = @{
                          @"xh" : username,
                          @"password" : password,
                          @"code" : securityCode,
                          @"cookie" : cookie
                          };
    NSLog(@"userInfoDict--%@",userInfoDict);
    [_loginModel postUserInfo:userInfoDict callback:^(NSDictionary *result) {
        callback(result);
    }];
}

@end
