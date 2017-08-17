//
//  WXYLeftMenuController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/7/31.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYLeftMenuController.h"

@interface WXYLeftMenuController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *imageArray;
@property(nonatomic, strong) NSArray *itemArray;
@property(nonatomic, strong) WXYHeaderView *headerView;
@end

@implementation WXYLeftMenuController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    _imageArray = @[@"school",@"kaoqin",@"lib",@"sheet",@"run"];
    _itemArray = @[@"教务信息",@"考勤信息",@"图书馆",@"体育选课",@"跑步"];
}

#pragma mark --UITableView

- (UITableView *)tableView{
    if (_tableView == nil){
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        //设置代理
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = kScreenRatio * 60;
        //tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        _headerView = [[WXYHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidht, kScreenHeight * 0.25)];
        tableView.tableHeaderView = _headerView;
        _tableView = tableView;
    }
    return  _tableView;
}


#pragma maek -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"status";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageArray[indexPath.row]]];
        [cell.contentView addSubview: iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.contentView.mas_left).with.offset(kScreenRatio * 20);
            make.centerY.equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(kScreenRatio * 20);
            make.height.mas_equalTo(kScreenRatio * 20);
        }];
        UILabel *itemLabel = [[UILabel alloc] init];
        itemLabel.text = _itemArray[indexPath.row];
        itemLabel.font = [UIFont fontWithName:@"Courier New" size:12 * kScreenRatio];
        [cell.contentView addSubview:itemLabel];
        [itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconView.mas_right).with.offset(kScreenRatio * 40);
            make.centerY.equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(kScreenRatio * 80);
            make.height.mas_equalTo(kScreenRatio *20);
        }];
        
    }
    return cell;
}

#pragma mark --UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            WXYEduController *eduVC = [[WXYEduController alloc] init];
            [UIViewController changeViewControllerByNavigationVCInRevealVCFront:eduVC];
        }
            break;
        case 1:{
            WXYAttendceController *attendceVC = [[WXYAttendceController alloc] init];
            [UIViewController changeViewControllerByNavigationVCInRevealVCFront:attendceVC];
        }
            break;

        case 2:{
            WXYLibraryController *libraryVC = [[WXYLibraryController alloc] init];
            [UIViewController changeViewControllerByNavigationVCInRevealVCFront:libraryVC];
        }
            break;

        case 3:{
            WXYRunViewController *runVC = [[WXYRunViewController alloc] init];
            [UIViewController changeViewControllerByNavigationVCInRevealVCFront:runVC];
        }
            break;
        case 4:{
            WXYSportsController *sportVC = [[WXYSportsController alloc] init];
            [UIViewController changeViewControllerByNavigationVCInRevealVCFront:sportVC];
        }
            break;

        default:
            break;
    }
}

@end
