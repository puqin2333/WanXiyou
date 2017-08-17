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
        callback(result);
    }];
}

- (void)requestScore:(Callback)callback {
    WXYScoreModel *scoreModel = [[WXYScoreModel alloc] init];
    [scoreModel getScorResultBack:^(NSDictionary *result) {
        callback(result);
    }];
}

- (void)requestScoreStatus:(Callback)callback {
    WXYStatusModel *scoreStatusModel = [[WXYStatusModel alloc] init];
    [scoreStatusModel getStatusResultBack:^(id result) {
        callback(result);
    }];
}

- (void)requestPlan:(Callback)callback {
    WXYPlanModel *planModel = [[WXYPlanModel alloc] init];
    [planModel  getPlanResultBack:^(id result) {
        callback(result);
    }];
}
@end
