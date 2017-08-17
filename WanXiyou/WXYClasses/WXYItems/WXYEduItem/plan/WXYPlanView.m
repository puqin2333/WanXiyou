//
//  WXYPlanView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYPlanView.h"

@interface WXYPlanView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WXYPlanView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.teamPlanListTableView];
    };
    return self;
}
- (void)getColorArray:(NSArray<UIColor *> *)colorArray titleArray:(NSArray *)dataSource{
    self.dataSource = dataSource;
    self.colorArray = colorArray;
}


#pragma mark --UITableView

- (UITableView *)teamPlanListTableView {
    if (_teamPlanListTableView == nil) {
        UITableView *teamPlanListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidht * 0.86, kScreenHeight * 0.7) style:UITableViewStylePlain];
        teamPlanListTableView.delegate = self;
        teamPlanListTableView.dataSource = self;
        teamPlanListTableView.layer.cornerRadius = 10.0f;
        teamPlanListTableView.layer.masksToBounds = YES;
        [teamPlanListTableView registerClass:[WXYScoreCell class] forCellReuseIdentifier:@"scoreCell"];
        self.teamPlanListTableView = teamPlanListTableView;
        self.teamPlanListTableView.tableFooterView = [UIView new];
    }
    return _teamPlanListTableView;
}
//  选中处理：首先将其他 cell 隐藏，取出 tableview 的可见 cell，将其他cell的透明度都设为0
- (void)tableView:(UITableView *)tableView selectCellAtIndexPath:(NSIndexPath *)indexPath {
    
    WXYPlanListCell *cell = [tableView cellForRowAtIndexPath:indexPath];
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
    WXYPlanListCell *cell = [WXYPlanListCell cellWithTableView:tableView indexPath:indexPath];
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
    [presenter requestPlan:^(id result) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getPlanModel" object:nil userInfo:result];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

@end
