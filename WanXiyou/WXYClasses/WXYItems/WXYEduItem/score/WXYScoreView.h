//
//  WXYScoreView.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/3.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYScoreView : UIView

@property(nonatomic, strong) NSArray *dataSource;
@property(nonatomic, strong) UITableView *scoreListTableView;
@property(nonatomic, strong) NSArray<UIColor *> *colorArray;

- (void)getColorArray:(NSArray<UIColor *> *)colorArray titleArray:(NSArray *)dataSource;

@end
