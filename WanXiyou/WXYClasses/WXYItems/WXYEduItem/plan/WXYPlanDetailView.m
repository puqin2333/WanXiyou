//
//  WXYPlanDetailView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYPlanDetailView.h"

@interface WXYPlanDetailView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *studyPlanTableView;
@property(nonatomic, strong) NSArray *detailModel;

@end

@implementation WXYPlanDetailView

- (instancetype)initWithFrame:(CGRect)frame indexPath:(NSUInteger)indexPath {
    if (self = [super initWithFrame:frame]) {
        self.indexPath = indexPath;
        [SVProgressHUD show];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getPlanModelData:) name:@"getPlanModel" object:nil];
        [self studyPlanTableView];
        NSLog(@"index --- > %ld",(unsigned long)self.indexPath);
        self.backgroundColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:1.00f];
        
    }
    return self;
}

- (void)getPlanModelData:(NSNotification *)notification {
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        dispatch_sync(concurrentQueue, ^{
            NSDictionary *getModel = [notification userInfo];
            NSLog(@"getModel -- > %@",getModel);
            NSArray *teamDetail = getModel[@"data"];
            self.detailModel =  teamDetail[self.indexPath];
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.studyPlanTableView.delegate = self;
            self.studyPlanTableView.dataSource = self;
            [SVProgressHUD dismiss];
        });
    });
}

#pragma mark --UITableView

- (UITableView *)studyPlanTableView {
    
    if (_studyPlanTableView == nil) {
        UITableView *studyPlanTableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        studyPlanTableView.rowHeight = 100;
        studyPlanTableView.allowsSelection = NO;
        [self addSubview:studyPlanTableView];
        
        [studyPlanTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@(5));
            make.top.equalTo(@(5));
            make.trailing.equalTo(@(-5));
            make.height.mas_equalTo(330);
        }];
        [_studyPlanTableView registerClass:[WXYScoreDetailCell class] forCellReuseIdentifier:@"planDetail"];
        
        self.studyPlanTableView = studyPlanTableView;
    }
    return _studyPlanTableView;
}


#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _detailModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WXYPlanDetailViewCell *cell = [WXYPlanDetailViewCell cellWithTableView:tableView];
    NSDictionary *lessonDetailScore = self.detailModel[indexPath.row];
    NSString *lesson = lessonDetailScore[@"课程名称"];
    NSString *characterLesson = [NSString stringWithFormat:@"课程性质: %@",lessonDetailScore[@"课程性质"]];
    NSString *time = [NSString stringWithFormat:@"起始结束周: %@",lessonDetailScore[@"起始结束周"]];
    NSString *credit = [NSString stringWithFormat:@"学分: %@",lessonDetailScore[@"学分"]];
    NSString *examway = [NSString stringWithFormat:@"考核方式: %@",lessonDetailScore[@"考核方式"]];
    NSLog(@"考核方式 -- > %@",examway);
    cell.lessonLabel.text = lesson;
    cell.characterLabel.text = characterLesson;
    cell.timeLabel.text = time;
    cell.creditLabel.text = credit;
    cell.examWayLabel.text = examway;
    
    return cell;
}

// 移除通知
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
