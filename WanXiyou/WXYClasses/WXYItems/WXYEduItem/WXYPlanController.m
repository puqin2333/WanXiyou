//
//  WXYPlanController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYPlanController.h"

@interface WXYPlanController ()

@property(nonatomic, strong) WXYScoreView *scoreView;

@end

@implementation WXYPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreView = [[WXYScoreView alloc] initWithFrame:CGRectMake(kScreenWidht * 0.07, kScreenHeight * 0.12, kScreenWidht * 0.86, kScreenHeight * 0.7)];
    [_scoreView getColorArray:self.colorArray titleArray:self.titleArray];
    
    [self.view addSubview:_scoreView];
}

// cell 的标题
- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"第一学期",@"第二学期",@"第三学期",@"第四学期",@"第五学期",@"第六学期",@"第七学期",@"第八学期"];
    }
    return _titleArray;
}
// 颜色
- (NSArray *)colorArray {
    if (_colorArray == nil) {
        UIColor *color1 = [UIColor colorWithRed:0.39f green:0.71f blue:0.76f alpha:1.00f];
        UIColor *color2 = [UIColor colorWithRed:0.44f green:0.75f blue:0.79f alpha:1.00f];
        UIColor *color3 = [UIColor colorWithRed:0.50f green:0.76f blue:0.76f alpha:1.00f];
        UIColor *color4 = [UIColor colorWithRed:0.57f green:0.76f blue:0.72f alpha:1.00f];
        UIColor *color5 = [UIColor colorWithRed:0.65f green:0.77f blue:0.68f alpha:1.00f];
        UIColor *color6 = [UIColor colorWithRed:0.80f green:0.78f blue:0.59f alpha:1.00f];
        UIColor *color7 = [UIColor colorWithRed:1.00f green:0.76f blue:0.36f alpha:1.00f];
        UIColor *color8 = [UIColor colorWithRed:1.00f green:0.71f blue:0.22f alpha:1.00f];
        _colorArray = @[color1,color2,color3,color4,color5,color6,color7,color8];
    }
    return _colorArray;
}

@end
