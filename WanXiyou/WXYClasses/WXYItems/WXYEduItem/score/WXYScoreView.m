//
//  WXYScoreView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/3.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYScoreView.h"

@interface WXYScoreView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WXYScoreView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scoreListTableView];
    };
    return self;
}
- (void)getColorArray:(NSArray<UIColor *> *)colorArray titleArray:(NSArray *)dataSource{
    self.dataSource = dataSource;
    self.colorArray = colorArray;
}


#pragma mark --UITableView

- (UITableView *)scoreListTableView {
    if (_scoreListTableView == nil) {
        UITableView *scoreListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidht * 0.86, kScreenHeight * 0.7) style:UITableViewStylePlain];
        scoreListTableView.delegate = self;
        scoreListTableView.dataSource = self;
        scoreListTableView.layer.cornerRadius = 10.0f;
        scoreListTableView.layer.masksToBounds = YES;
        [scoreListTableView registerClass:[WXYScoreCell class] forCellReuseIdentifier:@"scoreCell"];
        self.scoreListTableView = scoreListTableView;
        self.scoreListTableView.tableFooterView = [UIView new];
    }
    return _scoreListTableView;
}
//  选中处理：首先将其他 cell 隐藏，取出 tableview 的可见 cell，将其他cell的透明度都设为0
- (void)tableView:(UITableView *)tableView selectCellAtIndexPath:(NSIndexPath *)indexPath {

    WXYScoreCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView bringSubviewToFront:cell];
    for (UIView *subCell in tableView.visibleCells) {
        if (subCell != cell) {
            subCell.alpha = 0;
        }
    }
    tableView.allowsSelection = NO;
    tableView.scrollEnabled = NO;
    [cell selectToShowDetailWithContentOffsetY:tableView.contentOffset.y];
}

#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WXYScoreCell *cell = [WXYScoreCell cellWithTableView:tableView indexPath:indexPath];
    cell.backgroundColor = self.colorArray[indexPath.row];
    cell.termLabel.text = _dataSource[indexPath.row];
    [cell addSelectBlock:^{

        [self tableView:tableView selectCellAtIndexPath:indexPath];
    }];
    [cell addDeselectBlock:^() {
        for (UIView *subcell in tableView.visibleCells) {
            if (subcell != cell) {
                subcell.alpha = 1;
            }
        }
        tableView.allowsSelection = YES;
        tableView.scrollEnabled = YES;
    }];
    
    return cell;
}


#pragma mark --UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self tableView:tableView selectCellAtIndexPath:indexPath];
    
    WXYEduPresenters* presenter = [[WXYEduPresenters alloc] init];
    [presenter requestScore:^(id result) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getScore" object:nil userInfo:result];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
@end
