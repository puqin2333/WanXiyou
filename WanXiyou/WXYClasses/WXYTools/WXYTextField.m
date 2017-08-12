//
//  WXYTextField.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/8.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYTextField.h"

@implementation WXYTextField

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {

    //光标颜色
    self.tintColor= self.textColor;
    
    //占位符的颜色和大小
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:14]}];
    
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    
//        NSString *holderText = @"1223";
//    
//    NSMutableAttributedString *placeholder=[[NSMutableAttributedString alloc] initWithString:holderText];
//    
//    [placeholder addAttribute:NSForegroundColorAttributeName
//     
//                        value:[UIColor whiteColor]
//     
//                        range:NSMakeRange(0, holderText.length)];
//    
//    [placeholder addAttribute:NSFontAttributeName
//     
//                        value:[UIFont boldSystemFontOfSize:13]
//     
//                        range:NSMakeRange(0, holderText.length)];
//    
//    self.attributedPlaceholder = placeholder;

//
    // 不成为第一响应者
    [self resignFirstResponder];
}

/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder {
    // 修改占位文字颜色
//    NSString *holderText = self.placeholder;
//    
//    NSMutableAttributedString *placeholder=[[NSMutableAttributedString alloc] initWithString:holderText];
//    
//    [placeholder addAttribute:NSForegroundColorAttributeName
//     
//                        value:[UIColor colorWithRed:0.02f green:0.60f blue:0.65f alpha:1.00f]
//     
//                        range:NSMakeRange(0, holderText.length)];
//    
//    [placeholder addAttribute:NSFontAttributeName
//     
//                        value:[UIFont boldSystemFontOfSize:14]
//     
//                        range:NSMakeRange(0, holderText.length)];
//    
//    self.attributedPlaceholder = placeholder;

    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder {
    // 修改占位文字颜色
//    NSString *holderText = self.placeholder;
//    
//    NSMutableAttributedString *placeholder=[[NSMutableAttributedString alloc] initWithString:holderText];
//    
//    [placeholder addAttribute:NSForegroundColorAttributeName
//     
//                        value:[UIColor whiteColor]
//     
//                        range:NSMakeRange(0, holderText.length)];
//    
//    [placeholder addAttribute:NSFontAttributeName
//     
//                        value:[UIFont boldSystemFontOfSize:14]
//     
//                        range:NSMakeRange(0, holderText.length)];
//    
//    self.attributedPlaceholder = placeholder;
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

    return [super resignFirstResponder];
}
//控制placeHolder的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    return inset;
}

//控制显示文本的位置
- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    return inset;
}

//控制编辑文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x +15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    return inset;
}


@end
