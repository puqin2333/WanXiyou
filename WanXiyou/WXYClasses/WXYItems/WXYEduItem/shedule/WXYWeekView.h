//
//  WXYWeekView.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYWeekView : UIView

@property(nonatomic, strong) UIView *weekHeaderView;
@property(nonatomic, strong) UIView *classSectionView;
@property(nonatomic, strong) UIScrollView *weakScrollView;
@property(nonatomic, strong) UICollectionView *leasonShowView;
@property(nonatomic, strong) NSArray *colorArray;

@end
