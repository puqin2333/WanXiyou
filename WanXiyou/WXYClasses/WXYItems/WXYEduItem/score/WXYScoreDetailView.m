//
//  WXYScoreDetailView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/4.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYScoreDetailView.h"
#import "WXYScoreDetailCell.h"

@interface WXYScoreDetailView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *scoreTableView;
@property(nonatomic, strong) NSArray *detailModel;

@end

@implementation WXYScoreDetailView

- (instancetype)initWithFrame:(CGRect)frame indexPath:(NSUInteger)indexPath {
    if (self = [super initWithFrame:frame]) {
        self.indexPath = indexPath;
        [SVProgressHUD show];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getScoreModelData:) name:@"getScore" object:nil];
        [self scoreTableView];
        self.backgroundColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:1.00f];
     
    }
    return self;
}

- (void)getScoreModelData:(NSNotification *)notification {
    //  GCD 上异步执行 数据加载的任务
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        dispatch_sync(concurrentQueue, ^{
            NSDictionary *getModel = [notification userInfo];
            NSArray *dataModel = getModel[@"data"];
            NSDictionary *teamList = dataModel[0];
            NSArray *teamListArray = [self sortedDictionary:teamList];
            if (teamListArray.count <= self.indexPath) {
                
            } else {
                NSString *team = teamListArray[self.indexPath];
                NSDictionary *teamDetail = dataModel[1];
                self.detailModel =  teamDetail[team];
            }
        });
        dispatch_sync(dispatch_get_main_queue(), ^{

            self.scoreTableView.delegate = self;
            self.scoreTableView.dataSource = self;
            [SVProgressHUD dismiss];
        });
    });
}

#pragma mark --UITableView

- (UITableView *)scoreTableView {
    
    if (_scoreTableView == nil) {
        UITableView *scoreTableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        scoreTableView.rowHeight = 100;
        scoreTableView.allowsSelection = NO;
        [self addSubview:scoreTableView];
        
        [scoreTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@(5));
            make.top.equalTo(@(5));
            make.trailing.equalTo(@(-5));
            make.height.mas_equalTo(330);
        }];
        [_scoreTableView registerClass:[WXYScoreDetailCell class] forCellReuseIdentifier:@"scoreDetail"];
        
        self.scoreTableView = scoreTableView;
    }
    return _scoreTableView;
}


#pragma mark --UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _detailModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WXYScoreDetailCell *cell = [WXYScoreDetailCell cellWithTableView:tableView];
    
    NSDictionary *lessonDetailScore = self.detailModel[indexPath.row];
    NSString *lesson = lessonDetailScore[@"kcmc"];
    NSString *characterLesson = [NSString stringWithFormat:@"课程性质: %@",lessonDetailScore[@"kcxz"]];
    NSString *score = [NSString stringWithFormat:@"最终成绩: %@",lessonDetailScore[@"cj"]];
    NSString *credit = [NSString stringWithFormat:@"学分: %@",lessonDetailScore[@"xf"]];
    NSString *point = [NSString stringWithFormat:@"绩点: %@",lessonDetailScore[@"jd"]];
    cell.lessonLabel.text = lesson;
    cell.characterLabel.text = characterLesson;
    cell.scorelabel.text = score;
    cell.creditLabel.text = credit;
    cell.ponitLabel.text = point;

    return cell;
}

// 移除通知
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 因为请求下来的数据,和实际要展示在界面上的顺序，不同，所以我们需要对字典根据 values 重新排序
- (NSArray *)sortedDictionary:(NSDictionary *)willSortDict {
    NSArray *allValueArray = [willSortDict allValues];
    NSArray *sortedValueArray = [allValueArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        /**
         - (NSComparisonResult)compare:(NSString *)string;
         
         compare方法的比较原理为,依次比较当前字符串的第一个字母:
         如果不同,按照输出排序结果
         如果相同,依次比较当前字符串的下一个字母(这里是第二个)
         以此类推
         
         排序结果
         NSComparisonResult resuest = [obj1 compare:obj2];为从小到大,即升序;
         NSComparisonResult resuest = [obj2 compare:obj1];为从大到小,即降序;
         
         注意:compare方法是区分大小写的,即按照ASCII排序
         */
        NSComparisonResult result = [obj1 compare:obj2];
        return result;
    }];
    return sortedValueArray;
}


@end
