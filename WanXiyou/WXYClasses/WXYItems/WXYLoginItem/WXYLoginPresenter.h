//
//  WXYLoginPresenter.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/8.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXYLoginPresenter : NSObject

- (void)requestsecurityCode:(Callback)callback;

- (void)loginWithUsername:(NSString *)username password:(NSString *)password securityCode:(NSString *)securityCode cookie:(NSString *)cookie callback:(Callback)callback;

@end
