//
//  WXYStatsController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYStatsController.h"

@interface WXYStatsController ()<UICollectionViewDataSource>

@property(nonatomic, strong) WXYScoreStatusView *scoreStatusView;
@property(nonatomic, strong) WXYBezierCurveView *bezierCurveView;
@property(nonatomic, strong) NSMutableArray *x_names;
@property(nonatomic, strong) NSMutableArray *targets1;
@property(nonatomic, strong) NSMutableArray *targets2;
@property(nonatomic, strong) NSMutableArray *targets3;
@property(nonatomic, strong) NSArray *statusModelArray;

@end

@implementation WXYStatsController

/**
 *  X轴值
 */
-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[_statusModelArray[1][0],_statusModelArray[3][0],_statusModelArray[2][0]]];
    }
    return _x_names;
}
/**
 *  Y轴值
 */
-(NSMutableArray *)targets1 {
    if (!_targets1) {
        _targets1 = [NSMutableArray arrayWithArray:@[_statusModelArray[1][1],_statusModelArray[3][1],_statusModelArray[2][1]]];
    }
    return _targets1;
}

-(NSMutableArray *)targets2 {
    if (!_targets2) {
        _targets2 = [NSMutableArray arrayWithArray:@[_statusModelArray[1][3],_statusModelArray[3][3],_statusModelArray[2][3]]];
    }
    return _targets2;
}

-(NSMutableArray *)targets3 {
    if (!_targets3) {
        _targets3 = [NSMutableArray arrayWithArray:@[_statusModelArray[1][4],_statusModelArray[3][4],_statusModelArray[2][4]]];
    }
    return _targets3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreStatusView = [[WXYScoreStatusView alloc] initWithFrame:CGRectMake(0, 50 * kScreenRatio, kScreenWidht, kScreenHeight * 0.45 - 50 * kScreenRatio)];
    [SVProgressHUD show];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getStatusModel:) name:@"getScoreStatus" object:nil];
}

- (void)getStatusModel:(NSNotification *)notification {
    
//    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(concurrentQueue, ^{
//        dispatch_sync(concurrentQueue, ^{
//            NSDictionary *getModel = [notification userInfo];
//            NSArray *dataModel = getModel[@"data"];
//            NSDictionary *teamList = dataModel[0];
//            NSArray *teamListArray = [self sortedDictionary:teamList];
//            if (teamListArray.count <= self.indexPath) {
//                
//            } else {
//                NSString *team = teamListArray[self.indexPath];
//                NSDictionary *teamDetail = dataModel[1];
//                self.detailModel =  teamDetail[team];
//            }
//        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            [SVProgressHUD dismiss];
//            self.scoreTableView.delegate = self;
//            self.scoreTableView.dataSource = self;
//        });
//    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *statusModel = notification.userInfo;
            NSArray *model = statusModel[@"data"];
            NSDictionary *statusDict = model[1];
            self.statusModelArray = statusDict[@"data"];
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            self.scoreStatusView = [[WXYScoreStatusView alloc] initWithFrame:CGRectMake(0, 50 * kScreenRatio, kScreenWidht, kScreenHeight * 0.45 - 50 * kScreenRatio)];
            [self.view addSubview:_scoreStatusView];
            self.scoreStatusView.scoreStatusShowView.dataSource = self;
            
            self.bezierCurveView = [WXYBezierCurveView initWithFrame:CGRectMake(kScreenWidht * 0.1 , kScreenHeight * 0.45, kScreenWidht * 0.8 , kScreenHeight * 0.4)];
            [self.view addSubview:_bezierCurveView];
            // 折线图
            [self drawLineChart];
        });
    });
   
}

-(void)drawLineChart{
    //直线
    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets1 LineType:LineType_Straight LineColor:[UIColor colorWithRed:0.36f green:0.74f blue:0.82f alpha:1.00f]];
    
    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets2 LineType:LineType_Straight LineColor:[UIColor colorWithRed:0.94f green:0.58f blue:0.00f alpha:1.00f]];
    
    [_bezierCurveView drawLineChartViewWithX_Value_Names:self.x_names TargetValues:self.targets3 LineType:LineType_Straight LineColor:[UIColor colorWithRed:0.63f green:0.75f blue:0.66f alpha:1.00f]];
    
}

#pragma mark --UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WXYScoreStatusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    NSArray *model = _statusModelArray[indexPath.section];
    
    cell.scoreLabel.text = model[indexPath.row];
    
    if (indexPath.section == 0 && indexPath.row != 0) {

        cell.backgroundColor = [UIColor colorWithRed:0.98f green:0.86f blue:0.67f alpha:1.00f];
        
    } else if (indexPath.row == 0 && indexPath.section != 0) {
        
        cell.backgroundColor = [UIColor colorWithRed:0.74f green:0.91f blue:0.95f alpha:1.00f];
        
    } else if (indexPath.section == 0 && indexPath.row == 0) {
        
        cell.backgroundColor = [UIColor colorWithRed:0.74f green:0.77f blue:0.63f alpha:1.00f];
        
    } else {
        
        cell.scoreLabel.textColor = [UIColor colorWithRed:0.36f green:0.74f blue:0.82f alpha:1.00f];
        cell.scoreLabel.font = [UIFont fontWithName:@"IowanOldStyle-Italic" size:18 * kScreenRatio];
    }
    cell.layer.borderColor = [UIColor colorWithRed:0.23f green:0.72f blue:0.80f alpha:1.00f].CGColor;
    cell.layer.borderWidth = 0.5f;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (void)viewWillAppear:(BOOL)animated {
    WXYEduPresenters *presenter = [[WXYEduPresenters alloc] init];
    [presenter requestScoreStatus:^(id result) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getScoreStatus" object:nil userInfo:result];
    }];

    
}


@end
