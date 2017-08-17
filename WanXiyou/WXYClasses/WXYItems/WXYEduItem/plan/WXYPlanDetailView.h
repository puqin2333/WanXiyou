//
//  WXYPlanDetailView.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYPlanDetailView : UIView

@property(nonatomic, assign) NSUInteger indexPath;

- (instancetype)initWithFrame:(CGRect)frame indexPath:(NSUInteger)indexPath;

@end
