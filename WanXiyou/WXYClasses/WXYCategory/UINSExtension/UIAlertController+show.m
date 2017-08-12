//
//  UIAlertController+show.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/9.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "UIAlertController+show.h"

@implementation UIAlertController (show)

+ (instancetype)showAlertWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    return alertController;
}
@end
