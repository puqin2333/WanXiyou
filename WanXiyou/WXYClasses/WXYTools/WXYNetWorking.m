//
//  WXYNetWorking.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/8.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYNetWorking.h"

static AFHTTPSessionManager *manager = nil;
@implementation WXYNetWorking

+ (AFHTTPSessionManager *)shareManager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}

+ (void)wxy_Request:(NSString *)url params:(NSDictionary*)params requestType:(HttpRequestType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError* error))failure {
    AFHTTPSessionManager *manager = [WXYNetWorking shareManager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
               
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
            break;
        }
        case HttpRequestTypePost:
        {
            [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];

            break;
        }
    }
}


@end
