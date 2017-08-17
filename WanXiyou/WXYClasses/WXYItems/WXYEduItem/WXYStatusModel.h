//
//  WXYStatusModel.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestBack)(id result);

@interface WXYStatusModel : NSObject

- (void)getStatusResultBack:(RequestBack)requestback;

@end
