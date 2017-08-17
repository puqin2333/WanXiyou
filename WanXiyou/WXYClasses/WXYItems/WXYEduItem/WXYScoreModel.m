//
//  WXYScoreModel.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/13.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYScoreModel.h"

@implementation WXYScoreModel

- (void)getScorResultBack:(Requestback)requestback {
    //getScoresStatistics
    NSString *scoreURL = @"http://139.199.20.248:8080/WanXiyou/edu/getScoresList";
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [WXYNetWorking wxy_Request:scoreURL params:appDelegate.paramDict requestType:HttpRequestTypeGet success:^(id responseObject) {
        requestback(responseObject);
    } failure:^(NSError *error) {
        NSLog(@"error -- > %@",error);
    }];
}
@end
