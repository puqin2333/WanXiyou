//
//  WXYScoreStatusView.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/5.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYScoreStatusView.h"

@interface WXYScoreStatusView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSArray *array;
@property(nonatomic, strong) NSArray *array1;

@end

@implementation WXYScoreStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    
    
    return self;
}

- (void)initUI {
    [self addSubview:self.scoreStatusShowView];
    //注册collectionViewCell: WXYLessonCollectionCell 是我自定义的 cell
    [self.scoreStatusShowView registerClass:[WXYScoreStatusCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark -- UICollectionView
// 懒加载
- (UICollectionView *)scoreStatusShowView {
    if (_scoreStatusShowView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.minimumLineSpacing = 1.0f; // 设置最小行间距
        layout.minimumInteritemSpacing = 1.0f; // 设置垂直间距
        
        UICollectionView *scoreStatusShowView = [[UICollectionView alloc] initWithFrame:CGRectMake(kScreenWidht * 0.05, kScreenRatio * 10, CGRectGetWidth(self.frame) - kScreenWidht * 0.1, CGRectGetHeight(self.frame) - kScreenRatio * 10) collectionViewLayout:layout];
        scoreStatusShowView.backgroundColor = [UIColor whiteColor];
        scoreStatusShowView.delegate = self;
//        scoreStatusShowView.dataSource = self;
        self.scoreStatusShowView = scoreStatusShowView;
        
        scoreStatusShowView.layer.borderColor = [UIColor colorWithRed:0.23f green:0.72f blue:0.80f alpha:1.00f].CGColor;
        scoreStatusShowView.layer.borderWidth = 1.0f;
    }
    return _scoreStatusShowView;
}

//#pragma mark --UICollectionViewDataSource
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 20;
//}
//
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    WXYScoreStatusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.layer.borderColor = [UIColor colorWithRed:0.23f green:0.72f blue:0.80f alpha:1.00f].CGColor;
//    cell.layer.borderWidth = 0.3f;
//
//    if (indexPath.row == 0) {
//        
//        cell.backgroundColor = [UIColor colorWithRed:0.74f green:0.77f blue:0.63f alpha:1.00f];
//        cell.scoreLabel.text = @"1234";
//        
//    } else if (indexPath.row % 5 == 0 && indexPath.row > 0) {
//        
//        cell.backgroundColor = [UIColor colorWithRed:0.74f green:0.91f blue:0.95f alpha:1.00f];
//        cell.scoreLabel.text = @"234";
//
//    } else if (indexPath.row < 5 && indexPath.row > 0) {
//        
//        cell.backgroundColor = [UIColor colorWithRed:0.98f green:0.86f blue:0.67f alpha:1.00f];
//        cell.scoreLabel.text = @"14";
//        
//    } else {
//        cell.scoreLabel.textColor = [UIColor colorWithRed:0.98f green:0.86f blue:0.67f alpha:1.00f];
//        cell.scoreLabel.text = @"34";
//    }
//    return cell;
//}
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}

#pragma mark -- UICollectionViewDelegateFlowLayout
/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((CGRectGetWidth(collectionView.frame) - 5)/5 ,(CGRectGetHeight(collectionView.frame) - 4)/4);
}


#pragma mark --UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第 %zd组 第%zd个",indexPath.section, indexPath.row);
}


@end
