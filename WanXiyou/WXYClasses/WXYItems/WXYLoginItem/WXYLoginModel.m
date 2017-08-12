//
//  WXYLoginModel.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/7.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYLoginModel.h"

static  WXYLoginModel *instance = nil;
@implementation WXYLoginModel


+ (instancetype)shareInstance {
    if (instance == nil) {
        static dispatch_once_t once_token;
        dispatch_once(&once_token, ^{
            instance = [[WXYLoginModel alloc] init];
        });
    }
    return instance;
}

- (void)getResultback:(Callback)callback {
    //1. 构建 URL 资源地址
    NSString *securityCode = @"http://139.199.20.248:8080/WanXiyou/edu/GetScretImage";
    NSURL *url = [NSURL URLWithString:securityCode];
    //2. 创建一个 NSRequest 请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 配置 request
    // 设置请求方法
    [request setHTTPMethod:@"GET"];
    // 设置请求超时
    [request setTimeoutInterval:1.0];
    //3. 获得会话对象
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    //4. 根据会话对象创建一个Task
    /*
        第一个参数：请求对象
        第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
                  data：响应体信息（期望的数据）
                  response：响应头信息，主要是对服务器端的描述
                error：错误信息，如果请求失败，则error有值
    */
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            UIImage *image = [UIImage imageWithData:data];
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            NSDictionary *headers = [httpResponse allHeaderFields];
            NSLog(@"header -- >%@",headers);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSDictionary * result = @{
                                          @"set_Cookie":headers[@"Set-Cookie"],
                                          @"codeView":image
                                          };
                callback(result); // 返回数据类型
            });
        }
        else {
            NSLog(@"error-->%@",error);
        }
    }];
    [dataTask resume];
}

- (void)postUserInfo:(NSDictionary *)params callback:(Callback)callback {
    
    NSString *userInfoURL = @"http://139.199.20.248:8080/WanXiyou/edu/login";
//    AFHTTPSessionManager *userManager = [AFHTTPSessionManager manager];
//    userManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    [userManager POST:userInfoURL parameters: params progress:^(NSProgress * _Nonnull uploadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            callback(responseObject);
//            WXYLoginModel *model = [WXYLoginModel yy_modelWithDictionary:responseObject];
//            NSLog(@"%@",model.error);
//        });
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error---%@",error);
//    }];
    [WXYNetWorking wxy_Request:userInfoURL params:params requestType:HttpRequestTypePost success:^(id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            WXYLoginModel *model = [WXYLoginModel shareInstance];
            model = [WXYLoginModel yy_modelWithDictionary:responseObject];
            callback(responseObject);
        });
    } failure:^(NSError *error) {
        NSLog(@"error --> %@",error);
    }];
    //1. 构建 URL 资源地址
//    NSString *securityCode = @"http://139.199.20.248:8080/WanXiyou/edu/login";
//    NSURL *url = [NSURL URLWithString:securityCode];
//    //2. 创建一个 NSRequest 请求对象
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    // 配置 request
//    // 设置请求方法
//    [request setHTTPMethod:@"POST"];
//    // 设置请求超时
//    [request setTimeoutInterval:1.0];
//    // 设置请求头
////    request.HTTPBody =
//    NSMutableData *data = [[NSMutableData alloc]init];
//    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    [archiver encodeObject:params forKey:@"talkData"];
//    [archiver finishEncoding];
//    request.HTTPBody = data;
//    //3. 获得会话对象
//    NSURLSession *session = [NSURLSession sharedSession];
//    //4. 根据会话对象创建一个Task
//    /*
//     第一个参数：请求对象
//     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
//     data：响应体信息（期望的数据）
//     response：响应头信息，主要是对服务器端的描述
//     error：错误信息，如果请求失败，则error有值
//     */
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error == nil) {
//            NSLog(@"data -- %@",data);
//            NSString *dict = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
//            NSLog(@"dict -- %@",dict);
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            NSDictionary *headers = [httpResponse allHeaderFields];
//            NSLog(@"header -- >%@",headers);
//        }
//        else {
//            NSLog(@"error-->%@",error);
//        }
//    }];
//    [dataTask resume];

}

@end
