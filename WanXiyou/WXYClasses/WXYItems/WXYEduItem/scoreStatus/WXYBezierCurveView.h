//
//  WXYBezierCurveView.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/6.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MARGIN            30   // 坐标轴与画布间距
#define Y_EVERY_MARGIN    15   // y轴每一个值的间隔数
#define X_EVERY_MARGIN    (self.frame.size.width - MARGIN - MARGIN) /(x_names.count + 1)         // x 轴坐标

typedef NS_ENUM(NSInteger, LineType) {
    LineType_Straight, // 折线
    LineType_Curve     // 曲线
};

@interface WXYBezierCurveView : UIView

+ (instancetype)initWithFrame:(CGRect)frame;
/**
 *  画折线图
 *  @param x_names x 轴值的所有值名称
 *  @param targetValues 所有目标值
 *  @param lineType 直线类型
 *  @param lineColor 直线颜色
 **/

- (void)drawLineChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues LineType:(LineType) lineType LineColor:(UIColor *) lineColor;

///**
// *  画柱状图
// *  @param x_names      x轴值的所有值名称
// *  @param targetValues 所有目标值
// */
//- (void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues;


/**
 *  画饼状图
 *  @param x_names      x轴值的所有值名称
 *  @param targetValues 所有目标值
 */
- (void)drawPieChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues;


@end
