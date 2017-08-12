//
//  WXYScoreCell.h
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/5.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WXYCellSelectBlock)();
typedef void(^WXYCellDeselectBlock)();

@interface WXYScoreCell : UITableViewCell

@property(nonatomic, strong) UILabel *termLabel;
@property(nonatomic, strong) UIButton *detailButton;

- (void)addSelectBlock:(WXYCellSelectBlock)block;
- (void)addDeselectBlock:(WXYCellDeselectBlock)block;
- (void)selectToShowDetailWithContentOffsetY:(CGFloat)contentOffsetY;

@end
