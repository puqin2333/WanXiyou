//
//  WXYSheduleController.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/1.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYSheduleController.h"

@interface WXYSheduleController ()<UICollectionViewDataSource>

@property(nonatomic, strong) WXYWeekView *weekView;
@property(nonatomic, strong) WXYEduPresenters *presenter;
@property(nonatomic, strong) NSArray *lessonDataArray;
@property(nonatomic, strong) NSArray *colorArray;

@end

@implementation WXYSheduleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getModelData:) name:@"getModel" object:nil];
}

- (void)getModelData:(NSNotification *)notification {
    NSDictionary *getModel = [notification userInfo];
    self.lessonDataArray = getModel[@"data"];
    _weekView = [[WXYWeekView alloc] initWithFrame:CGRectMake(0, 50 * kScreenRatio, kScreenWidht, kScreenHeight - 50 * kScreenRatio)];
    [self.view addSubview:_weekView];
    _weekView.leasonShowView.dataSource = self;
}

#pragma mark --UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WXYLessonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *lessonArray = self.lessonDataArray[indexPath.section];
    NSDictionary *lessonModel = lessonArray[indexPath.row];
    if ([lessonModel[@"empty"] isEqualToString:@"0"]) {
        cell.backgroundColor = self.colorArray[indexPath.row*(indexPath.section + 1)%5];
        NSString *lesson = lessonModel[@"lesson"];
        NSArray *array = [lesson componentsSeparatedByString:@" "];
        cell.lessonLabel.text = array[0];
        cell.timeLabel.text = array[1];
        cell.teacherLabel.text = array[2];
        cell.classLabel.text = array[3];
        
    } else{
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.layer.cornerRadius = 20 * kScreenRatio;
    return cell;
}

// 设置颜色数组
- (NSArray *)colorArray {
    if (_colorArray == nil) {
        UIColor *color1 = [UIColor colorWithRed:0.54f green:0.76f blue:0.29f alpha:1.00f];
        UIColor *color2 = [UIColor colorWithRed:0.81f green:0.58f blue:0.84f alpha:1.00f];
        UIColor *color3 = [UIColor colorWithRed:0.99f green:0.75f blue:0.02f alpha:1.00f];
        UIColor *color4 = [UIColor colorWithRed:0.20f green:0.71f blue:0.89f alpha:1.00f];
        UIColor *color5 = [UIColor colorWithRed:0.99f green:0.35f blue:0.13f alpha:1.00f];
        _colorArray = @[color1,color2,color3,color4,color5];
    }
    return _colorArray;
    
}


// 移除通知
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
