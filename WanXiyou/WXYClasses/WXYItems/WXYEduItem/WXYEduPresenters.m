//
//  WXYEduPresenters.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/11.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYEduPresenters.h"

@implementation WXYEduPresenters

- (void)requestLessonList:(Callback)callback {
    self.lessonModel = [[WXYLessonModel alloc] init];
    [self.lessonModel getResultback:^(NSDictionary *result) {
//        NSLog(@"%@",result);
        callback(result);
    }];
}

@end
