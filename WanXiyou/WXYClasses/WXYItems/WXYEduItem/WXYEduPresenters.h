//
//  WXYEduPresenters.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/11.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WXYLessonModel;

typedef void (^Callback)(id result);

@interface WXYEduPresenters : NSObject

@property(nonatomic, strong) WXYLessonModel *lessonModel;

// presenter 接受 model 请求到的数据，然后返回 view 层进行刷新
- (void)requestLessonList:(Callback)callback;
- (void)requestScore:(Callback)callback;
- (void)requestScoreStatus:(Callback)callback;
- (void)requestPlan:(Callback)callback;

@end
