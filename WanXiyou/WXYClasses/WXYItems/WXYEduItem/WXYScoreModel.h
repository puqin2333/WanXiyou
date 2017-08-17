//
//  WXYScoreModel.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/13.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Requestscore)(id request);

@interface WXYScoreModel : NSObject

@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) NSString *xq;
@property(nonatomic, strong) NSString *kcmc;
@property(nonatomic, strong) NSString *xf;
@property(nonatomic, strong) NSString *jd;
@property(nonatomic, strong) NSString *cj;
@property(nonatomic, strong) NSString *kcxz;
@property(nonatomic, strong) NSString *kcdm;

//block 回调返回请求到的数据
- (void)getScorResultBack:(Requestback)requestback;

@end
