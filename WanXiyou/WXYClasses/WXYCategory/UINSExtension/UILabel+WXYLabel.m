//
//  UILabel+WXYLabel.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "UILabel+WXYLabel.h"

@implementation UILabel (WXYLabel)

+ (UILabel *)wxy_labelWithKindFontSize:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.numberOfLines = 0;
    return label;
}

@end
