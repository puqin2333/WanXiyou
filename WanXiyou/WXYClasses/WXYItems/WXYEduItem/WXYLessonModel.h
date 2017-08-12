//
//  WXYLessonModel.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Callback)(NSDictionary *result);

@interface WXYLessonListModel : NSObject

@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSString *error;
@property(nonatomic, strong) NSArray *data;

@end

@interface WXYLessonModel : NSObject

@property(nonatomic, strong) WXYLessonListModel *listModel;
@property(nonatomic, strong) NSString *empty;
@property(nonatomic, strong) NSString *lesson;
@property(nonatomic, strong) NSString *lesson_name;
@property(nonatomic, strong) NSString *lesson_teacher;
@property(nonatomic, strong) NSString *lesson_time;

- (void)getResultback:(Callback)callback;

@end
