//
//  WXYUserInfoModel.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/8.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXYUserInfoModel : NSObject

@property(nonatomic, strong) NSString *xh;    // 教务系统中得到的学号
@property(nonatomic, strong) NSString *dqszj;    // 当前所在级
@property(nonatomic, strong) NSString *cc;  // 学历层次
@property(nonatomic, strong) NSString *xy;    // 学院
@property(nonatomic, strong) NSString *xzb;  // 行政班
@property(nonatomic, strong) NSString *xz;  // 学制
@property(nonatomic, strong) NSString *xm;    // 姓名
@property(nonatomic, strong) NSString *zy;  // 专业名称


@end
