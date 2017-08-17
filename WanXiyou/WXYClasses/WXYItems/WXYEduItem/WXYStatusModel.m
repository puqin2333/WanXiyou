//
//  WXYStatusModel.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYStatusModel.h"

@implementation WXYStatusModel

- (void)getStatusResultBack:(RequestBack)requestback {
    //getScoresStatistics
    NSString *scoreURL = @"http://139.199.20.248:8080/WanXiyou/edu/getScoresStatistics";
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [WXYNetWorking wxy_Request:scoreURL params:appDelegate.paramDict requestType:HttpRequestTypeGet success:^(id responseObject) {
        requestback(responseObject);
    } failure:^(NSError *error) {
        NSLog(@"error -- > %@",error);
    }];
}

@end
