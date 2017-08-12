//
//  WXYWeekView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/2.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYWeekView.h"

@interface WXYWeekView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UIView *weekHeaderView;
@property(nonatomic, strong) UIView *classSectionView;
@property(nonatomic, strong) UIScrollView *weakScrollView;
@property(nonatomic, strong) UICollectionView *leasonShowView;
@property(nonatomic, strong) NSArray *colorArray;

@end

@implementation WXYWeekView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        [self initWeekView];
    }
    return self;
}

// 初始化周课表视图
- (void)initWeekView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidht, kScreenHeight - kScreenRatio * 85)];
    scrollView.contentSize = CGSizeMake(0, kScreenHeight);
    scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:scrollView];
    [self addSubview:self.weekHeaderView];
    [scrollView addSubview:self.classSectionView];
    self.weakScrollView = scrollView;
    [self initLessonTable];
    
}

// 自定义头部视图
- (UIView *)weekHeaderView {
    UIView *weekHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidht, kScreenRatio * 35)];
    weekHeaderView.backgroundColor = [UIColor whiteColor];
    
    int s = [[self getTheDayOfTheWeekByDateString] intValue];
    for (NSInteger i = 0; i <= 7; i++) {
        NSArray *weekDays = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
        
        UILabel *weekLabel= [UILabel wxy_labelWithKindFontSize:[UIFont fontWithName:@"Avenir-BlackOblique" size:12] textColor: [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f] textAlignment:NSTextAlignmentCenter];
        if (i == 0) {
            weekLabel.frame = CGRectMake(0, 0, kScreenRatio * 35, kScreenRatio * 35);
            weekLabel.layer.cornerRadius = 15 * kScreenRatio;
            weekLabel.layer.masksToBounds = YES;
            weekLabel.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
            weekLabel.tag = 10000 + i;
            [weekHeaderView addSubview:weekLabel];
        } else {
            weekLabel.frame = CGRectMake(kScreenRatio * 36 + (kScreenWidht - kScreenRatio * 36)/ 7 * (i - 1), 0, (kScreenWidht - kScreenRatio * 45) / 7, kScreenRatio * 35);
            weekLabel.layer.cornerRadius = 15 * kScreenRatio;
            weekLabel.layer.masksToBounds = YES;
            weekLabel.text = weekDays[i - 1];
            if (i == s) {
                weekLabel.backgroundColor = [UIColor colorWithRed:0.99f green:0.60f blue:0.00f alpha:1.00f];
                weekLabel.font = [UIFont fontWithName:@"BanglaSangamMN-Bold " size:15 * kScreenRatio];
                weekLabel.textColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
                [weekHeaderView addSubview:weekLabel];
            } else {
                weekLabel.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
                [weekHeaderView addSubview:weekLabel];
            }
        }
    }
    _weekHeaderView = weekHeaderView;
    return _weekHeaderView;
}
// 自定义侧边栏
- (UIView *)classSectionView {
    
    UIView *classSectionView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenRatio * 35, kScreenRatio * 85, kScreenHeight - kScreenRatio * 85)];
    NSArray *classSection = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
//    UILabel *sectionLabel= [[UILabel alloc] init];
    for (int i = 0; i < 10; i++) {
        UILabel *sectionLabel= [[UILabel alloc] init];
        sectionLabel.frame = CGRectMake(0, (kScreenHeight - kScreenRatio * 85)/10 * i, 35,(kScreenHeight - kScreenRatio * 85) / 10);
        sectionLabel.layer.cornerRadius = 15.0 *kScreenRatio;
        sectionLabel.layer.masksToBounds = YES;
        sectionLabel.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
        sectionLabel.tag = 1000 + i;
        sectionLabel.text = classSection[i];
        sectionLabel.font = [UIFont fontWithName:@"Avenir-BlackOblique" size:12];
        sectionLabel.textColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
        sectionLabel.textAlignment = NSTextAlignmentCenter;
        [classSectionView addSubview:sectionLabel];
    }
    _classSectionView = classSectionView;
    return _classSectionView;
}
//根据从系统获得的日期，判断当前日期是星期几
-(NSNumber *)getTheDayOfTheWeekByDateString {
    
    NSDateFormatter *inputFormatter=[[NSDateFormatter alloc]init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSDate *formatterDate=[inputFormatter dateFromString:locationString];
    NSDateFormatter *outputFormatter=[[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"EEEE-MMMM-d"];
    NSString *outputDateStr=[outputFormatter stringFromDate:formatterDate];
    NSArray *weekArray=[outputDateStr componentsSeparatedByString:@"-"];
    
    NSDictionary *dic = @{
                          @"Monday " : @1 ,
                          @"Tuesday" : @2 ,
                          @"Wednesday" : @3 ,
                          @"Thursday" : @4 ,
                          @"Friday" : @5 ,
                          @"Saturday" : @6 ,
                          @"Sunday" : @7
                          };
    NSString *week = [weekArray objectAtIndex:0];
    return dic[week];
}

#pragma mark -- UICollectionView
// 懒加载
- (UICollectionView *)leasonShowView {
    if (_leasonShowView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        // 设置collectionView的滚动方向，需要注意的是如果使用了collectionview的headerview或者footerview的话， 如果设置了水平滚动方向的话，那么就只有宽度起作用了了
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumLineSpacing = 1.0f; // 设置最小行间距
        layout.minimumInteritemSpacing = 1.0f; // 设置垂直间距
        
        UICollectionView *leasonShowView = [[UICollectionView alloc] initWithFrame:CGRectMake(kScreenRatio * 36, kScreenRatio * 36, kScreenWidht - kScreenRatio * 36, _weakScrollView.bounds.size.height) collectionViewLayout:layout];
        leasonShowView.backgroundColor = [UIColor whiteColor];
        leasonShowView.delegate = self;
        leasonShowView.dataSource = self;
        self.leasonShowView = leasonShowView;
    }
    return _leasonShowView;
}

- (void)initLessonTable {
    [self.weakScrollView addSubview: self.leasonShowView];
    
    //注册collectionViewCell: WXYLessonCollectionCell 是我自定义的 cell
    [self.leasonShowView registerClass:[WXYLessonCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.leasonShowView registerClass:[WXYLessonCollectionReusableView class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark --UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WXYLessonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    WXYEduPresenters *presenter = [[WXYEduPresenters alloc] init];
    [presenter requestLessonList:^(NSDictionary *result) {
        NSDictionary *lessonModelDic = [NSDictionary dictionary];
        lessonModelDic = result;
        NSLog(@"%@",lessonModelDic);
        NSArray *lessonList = lessonModelDic[@"data"];
        NSArray *lesson = lessonList[indexPath.section];
        NSDictionary *class = lesson[indexPath.row];
        if ([class[@"empty"] isEqualToString:@"0"]) {
            NSLog(@"%@",class[@"lesson"]);
            cell.backgroundColor = self.colorArray[indexPath.row*(indexPath.section + 1)%5];
        } else{
            cell.backgroundColor = [UIColor clearColor];
        }
    }];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    WXYLessonCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:uicoll withReuseIdentifier:@"cell" forIndexPath:indexPath];
//    WXYEduPresenters *presenter = [[WXYEduPresenters alloc] init];
//    [presenter requestLessonList:^(NSDictionary *result) {
//        NSDictionary *lessonModelDic = [NSDictionary dictionary];
//        lessonModelDic = result;
//        NSLog(@"%@",lessonModelDic);
//        WXYLessonModel *lessonModel = [WXYLessonModel yy_modelWithDictionary:lessonModelDic];
//        .teacherLabel.text = lessonModel.lesson_teacher;
//        NSArray *lessonList = lessonModelDic[@"data"];
//        NSArray *lesson = lessonList[indexPath.section];
//        NSDictionary *class = lesson[indexPath.row];
//        if ([class[@"empty"] isEqualToString:@"0"]) {
//            NSLog(@"%@",class[@"lesson"]);
//            cell.lessonLabel.text = class[@"lesson"];
//            cell.lessonLabel.textColor = [UIColor whiteColor];
//            cell.backgroundColor = self.colorArray[indexPath.row*(indexPath.section + 1)%5];
//            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:class[@"lesson"]];
//            //设置段落间的大小
//            NSMutableParagraphStyle *pargraphStyle = [[NSMutableParagraphStyle alloc] init];
//            [pargraphStyle setLineSpacing:3 * kScreenRatio];
//            [pargraphStyle setAlignment:NSTextAlignmentCenter];
//            //对attributedString对象设置间距属性
//            [attributedString addAttribute:NSParagraphStyleAttributeName value:pargraphStyle range:NSMakeRange(0, [attributedString length])];
//            [cell.lessonLabel setAttributedText:attributedString];
//        } else{
//            cell.backgroundColor = [UIColor clearColor];
//        }
//
//        NSLog(@"lesson -- %@",class[@"lesson"]);
//    }];
//
//}

#pragma mark -- UICollectionViewDelegateFlowLayout
/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenWidht - kScreenRatio * 45) / 7,(kScreenHeight - kScreenRatio * 85) / 5);
}


#pragma mark --UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第 %zd组 第%zd个",indexPath.section, indexPath.row);
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

@end
