//
//  WXYLessonModel.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYLessonModel.h"

@interface WXYLessonModel()

@property(nonatomic, strong) WXYLoginModel *loginModel;
@property(nonatomic, strong) WXYLessonModel *lessonModel;

@end

@implementation WXYLessonModel

- (void)getResultback:(Requestback)callback {
    NSString *urlString = @"http://139.199.20.248:8080/WanXiyou/edu/getLessonList";
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    
    [WXYNetWorking wxy_Request:urlString params:appDelegate.paramDict requestType:HttpRequestTypeGet success:^(id responseObject) {
        callback(responseObject);
    } failure:^(NSError *error) {
        NSLog(@"error--> %@",error);
    }];
}

@end
