//
//  WXYLessonModel.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Requestback)(NSDictionary *result);

@interface WXYLessonModel : NSObject

@property(nonatomic, strong) NSString *empty;
@property(nonatomic, strong) NSString *lesson_name;
@property(nonatomic, strong) NSString *lesson_teacher;
@property(nonatomic, strong) NSString *lesson_time;

- (void)getResultback:(Requestback)callback;

@end
