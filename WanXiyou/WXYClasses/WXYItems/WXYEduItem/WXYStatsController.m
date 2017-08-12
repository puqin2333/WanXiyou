//
//  WXYStatsController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYStatsController.h"

@interface WXYStatsController ()

@property(nonatomic, strong) WXYScoreStatusView *scoreStatusView;
@property(nonatomic, strong) WXYBezierCurveView *bezierCurveView;
@property(nonatomic, strong) NSMutableArray *x_names;
@property(nonatomic, strong) NSMutableArray *targets1;
@property(nonatomic, strong) NSMutableArray *targets2;
@property(nonatomic, strong) NSMutableArray *targets3;

@end

@implementation WXYStatsController

/**
 *  X轴值
 */
-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[@"必修课",@"选修课",@"课外实践教学"]];
    }
    return _x_names;
}
/**
 *  Y轴值
 */
-(NSMutableArray *)targets1 {
    if (!_targets1) {
        _targets1 = [NSMutableArray arrayWithArray:@[@90,@50,@70]];
    }
    return _targets1;
}

-(NSMutableArray *)targets2 {
    if (!_targets2) {
        _targets2 = [NSMutableArray arrayWithArray:@[@78,@30,@20]];
    }
    return _targets2;
}

-(NSMutableArray *)targets3 {
    if (!_targets3) {
        _targets3 = [NSMutableArray arrayWithArray:@[@15,@9,@0]];
    }
    return _targets3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreStatusView = [[WXYScoreStatusView alloc] initWithFrame:CGRectMake(0, 50 * kScreenRatio, kScreenWidht, kScreenHeight * 0.45 - 50 * kScreenRatio)];
    [self.view addSubview:_scoreStatusView];
    
    self.bezierCurveView = [WXYBezierCurveView initWithFrame:CGRectMake(kScreenWidht * 0.1 , kScreenHeight * 0.50, kScreenWidht * 0.8 , kScreenHeight * 0.4)];
    [self.view addSubview:_bezierCurveView];
    // 折线图
    [self drawLineChart];

}

-(void)drawLineChart{
    
    //直线
    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets1 LineType:LineType_Straight LineColor:[UIColor colorWithRed:0.36f green:0.74f blue:0.82f alpha:1.00f]];
    
    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets2 LineType:LineType_Straight LineColor:[UIColor colorWithRed:0.94f green:0.58f blue:0.00f alpha:1.00f]];
    
    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets3 LineType:LineType_Straight LineColor:[UIColor colorWithRed:0.63f green:0.75f blue:0.66f alpha:1.00f]];
    
    //曲线
//    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets LineType:LineType_Curve];
    
}


@end
