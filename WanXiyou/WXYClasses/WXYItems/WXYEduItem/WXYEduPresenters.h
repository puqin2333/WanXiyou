//
//  WXYEduPresenters.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/11.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WXYLessonModel;

typedef void(^Callback)(NSDictionary *result);

@interface WXYEduPresenters : NSObject

@property(nonatomic, strong) WXYLessonModel *lessonModel;

- (void)requestLessonList:(Callback)callback;

@end
