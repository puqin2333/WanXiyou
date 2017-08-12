//
//  WXYBezierCurveView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/6.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYBezierCurveView.h"

@interface WXYBezierCurveView ()

@property(nonatomic, assign) CGFloat leading;
@property(nonatomic, retain) UIColor *lineColor;

@end

static CGRect myFrame;

@implementation WXYBezierCurveView

+ (instancetype)initWithFrame:(CGRect)frame{
    
    WXYBezierCurveView *bezierCurveView = [[WXYBezierCurveView alloc] init];
    bezierCurveView.frame = frame;
    
    //背景视图
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    backView.backgroundColor = [UIColor clearColor];
    [bezierCurveView addSubview:backView];
    myFrame = frame;
    
    return bezierCurveView;
}

// 画坐标轴
-(void)drawXYLine:(NSMutableArray *)x_names{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 1.Y轴、X轴的直线
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(myFrame)- MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN, 2 * MARGIN)];
    
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(myFrame)-2*MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    
    // 2.添加箭头
    [path moveToPoint:CGPointMake(MARGIN, 2*MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN-5, 2 * MARGIN+5)];
    [path moveToPoint:CGPointMake(MARGIN, 2 * MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+5, 2 * MARGIN+5)];
    
    [path moveToPoint:CGPointMake(MARGIN+CGRectGetWidth(myFrame)-2*MARGIN, CGRectGetHeight(myFrame)- MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(myFrame)-2*MARGIN-5, CGRectGetHeight(myFrame)-MARGIN-5)];
    [path moveToPoint:CGPointMake(MARGIN+CGRectGetWidth(myFrame)-2*MARGIN, CGRectGetHeight(myFrame)- MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN+CGRectGetWidth(myFrame)-2*MARGIN-5, CGRectGetHeight(myFrame)- MARGIN+5)];
    
    // 3.添加索引格
    // X轴
    for (int i = 0; i < x_names.count; i++) {
        CGFloat X = MARGIN + X_EVERY_MARGIN *(i+1);
        CGPoint point = CGPointMake(X,CGRectGetHeight(myFrame)-MARGIN);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x, point.y-3)];
    }
    // Y轴（实际长度为150,此处比例缩小1.5倍使用）
    for (int i = 0; i < 11; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x+3, point.y)];
    }
    // 4.添加索引格文字
    // X轴
    for (int i = 0; i < x_names.count; i++) {
        CGFloat X = MARGIN + 25 + X_EVERY_MARGIN * i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, CGRectGetHeight(myFrame)-MARGIN, X_EVERY_MARGIN, 20)];
        textLabel.text = x_names[i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor colorWithRed:0.52f green:0.78f blue:0.80f alpha:1.00f];
        [self addSubview:textLabel];
    }
    
    // Y轴
    for (int i = 0; i < 11 ; i ++ ) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Y-5, MARGIN, 10)];
        textLabel.text = [NSString stringWithFormat:@"%d",10*i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor colorWithRed:0.52f green:0.78f blue:0.80f alpha:1.00f];
        [self addSubview:textLabel];
    }
    
    // 5.渲染路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor colorWithRed:0.52f green:0.78f blue:0.80f alpha:1.00f].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    shapeLayer.lineWidth = 2.0;
    [self.subviews[0].layer addSublayer:shapeLayer];
    
}

// 画折线图
- (void)drawLineChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues LineType:(LineType)lineType LineColor:(UIColor *)lineColor {
    // 1. 画坐标轴
    [self drawXYLine:x_names];
    
    // 2. 获取目标值点坐标
    NSMutableArray *allPoints = [NSMutableArray array];
    for (int i = 0; i < targetValues.count; i++) {
        CGFloat doubleValue = 1.5 * [targetValues[i] floatValue];
        CGFloat X = MARGIN + X_EVERY_MARGIN*(i + 1);
        CGFloat Y = CGRectGetHeight(myFrame) - MARGIN - doubleValue;
        CGPoint point = CGPointMake(X, Y);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(point.x-1, point.y-1, 2.5, 2.5) cornerRadius:2.5];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = lineColor.CGColor;
        layer.fillColor = lineColor.CGColor;
        layer.path = path.CGPath;
        [self.subviews[0].layer addSublayer:layer];
        [allPoints addObject:[NSValue valueWithCGPoint:point]];
    }
    
    // 坐标连线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[allPoints[0] CGPointValue]];
    CGPoint prePoint;
    switch (lineType) {
        case LineType_Straight:
            for (int i =1; i<allPoints.count; i++) {
                CGPoint point = [allPoints[i] CGPointValue];
                [path addLineToPoint:point];
            }
            break;
        case LineType_Curve:   //曲线
            for (int i =0; i<allPoints.count; i++) {
                if (i==0) {
                    prePoint = [allPoints[0] CGPointValue];
                } else {
                    CGPoint NowPoint = [allPoints[i] CGPointValue];
                    [path addCurveToPoint:NowPoint controlPoint1:CGPointMake((prePoint.x+NowPoint.x)/2, prePoint.y) controlPoint2:CGPointMake((prePoint.x+NowPoint.x)/2, NowPoint.y)]; //三次曲线
                    prePoint = NowPoint;
                }
            }
            break;
    }
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = lineColor.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    shapeLayer.lineWidth = 2.0f;
    [self.subviews[0].layer addSublayer:shapeLayer];
    
    // 4.添加目标值文字
    for (int i = 0; i < allPoints.count; i++) {
        UILabel *label = [UILabel wxy_labelWithKindFontSize:[UIFont systemFontOfSize:10] textColor:[UIColor colorWithRed:0.52f green:0.78f blue:0.80f alpha:1.00f] textAlignment:NSTextAlignmentCenter];
        [self.subviews[0] addSubview:label];
        if (i==0) {
            CGPoint nowPoint = [allPoints[0] CGPointValue];
            label.text = [NSString stringWithFormat:@"%.0lf",[targetValues[i] floatValue]];
            label.frame = CGRectMake(nowPoint.x-MARGIN/2, nowPoint.y-20, MARGIN, 20);
            prePoint = nowPoint;
        }else{
            CGPoint nowPoint = [allPoints[i] CGPointValue];
            if (nowPoint.y < prePoint.y) {  //文字置于点上方
                label.frame = CGRectMake(nowPoint.x - MARGIN/2, nowPoint.y - 20, MARGIN, 20);
            }else{ //文字置于点下方
                label.frame = CGRectMake(nowPoint.x-MARGIN/2, nowPoint.y, MARGIN, 20);
            }
            label.text = [NSString stringWithFormat:@"%.0lf",[targetValues[i] floatValue]];
            prePoint = nowPoint;
        }
    }
                            
}
@end
