//
//  WXYNetWorking.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/8.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <Foundation/Foundation.h>

// 网络请求类型
typedef NS_ENUM(NSUInteger , HttpRequestType) {
    //get请求
    HttpRequestTypeGet =0,
    // post请求
    HttpRequestTypePost
};

@interface WXYNetWorking : NSObject
// 单例方法解决 AFN 的内存泄漏问题
+ (AFHTTPSessionManager *)shareManager;

/**
 *发送网络请求
 *
 * @param url 请求的网址字符串
 * @param params 请求的参数
 * @param type 请求的类型
 * @param success 请求成功的结果
 * @param failure 请求失败的结果
 */
+ (void)wxy_Request:(NSString *)url params:(NSDictionary *)params requestType:(HttpRequestType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;






@end
