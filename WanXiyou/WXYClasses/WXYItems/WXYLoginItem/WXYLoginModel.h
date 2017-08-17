//
//  WXYLoginModel.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/7.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Callback)(id result);

@interface WXYLoginModel : NSObject

@property(nonatomic, strong) NSString *set_Cookie; //cookie
@property(nonatomic, strong) UIImage *codeView;  // 验证码
@property(nonatomic, strong) NSString *error;    // 获取信息失败
@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSDictionary *data; // 详细数据
@property(nonatomic, strong) NSString *cookie;   // 登陆使用的 cookie
@property(nonatomic, strong) NSDictionary *user_info; // 具体信息
@property(nonatomic, strong) WXYLoginPresenter *presenter;
@property(nonatomic, strong) NSDictionary *params; // 获取从presenter 传来的数据信息

+ (instancetype)shareInstance;

// 获取验证码
- (void)getResultback:(Callback)callback;
// 获取信息
- (void)postUserInfo:(NSDictionary *)params callback:(Callback)callback;

@end

@interface WXYLoginDataModel : NSObject

@property(nonatomic, strong) NSDictionary *user_info;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *ID;

@end

@interface WXYLoginUserInfoModel : NSObject

@property(nonatomic, strong) NSString *xh; // 学号
@property(nonatomic, strong) NSString *dqszj; // 当前所在的年级
@property(nonatomic, strong) NSString *cc; // 学历层次
@property(nonatomic, strong) NSString *xy; // 学院
@property(nonatomic, strong) NSString *xzb; // 行政班
@property(nonatomic, strong) NSString *xz; // 学制
@property(nonatomic, strong) NSString *xm; // 姓名
@property(nonatomic, strong) NSString *zy; //专业

@end
