//
//  WXYPlanListCell.m
//  WanXiyou
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/8/15.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "WXYPlanListCell.h"

@interface WXYPlanListCell ()

@property(nonatomic, strong) WXYPlanDetailView *detailView;
@property (nonatomic, strong) UIView *helperHideView;

@property(nonatomic, copy) WXYCellSelectBlock selectBlock;
@property(nonatomic, copy) WXYCellDeselectBlock deselectBlock;

@property(nonatomic, assign) CGRect originCellFrame;
@property(nonatomic, assign) CGRect originHelperViewFrame;
@property(nonatomic, assign) CGRect originDetailViewFrame;
@property(nonatomic, assign) NSIndexPath *indexPath;

@end

@implementation WXYPlanListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"teamlist";
    WXYPlanListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WXYPlanListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier indexPath:indexPath];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.indexPath = indexPath;
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.termLabel = [[UILabel alloc] init];
    self.detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self addSubview:_termLabel];
    [self addSubview:_detailButton];
    
    _termLabel.font = [UIFont systemFontOfSize:18];
    _termLabel.textColor = [UIColor whiteColor];
    [_termLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
    }];
    
    [self.detailButton setTitle:@"..." forState:UIControlStateNormal];
    [self.detailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.detailButton addTarget:self action:@selector(cellHandle) forControlEvents:UIControlEventTouchUpInside];
    [_detailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.detailButton.tag = 0;
    [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(@(-20));
        make.top.equalTo(self.termLabel.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(40, 20));
        
    }];
}

- (UIView *)helperHideView {
    if (_helperHideView == nil) {
        _helperHideView = [UIView new];
        _helperHideView.backgroundColor = [UIColor whiteColor];
        _helperHideView.alpha = 0;
    }
    return _helperHideView;
}

- (WXYPlanDetailView *)detailView {
    if (_detailView == nil) {
        _detailView = [[WXYPlanDetailView alloc]initWithFrame:self.frame indexPath:self.indexPath.row];
    }
    return _detailView;
}

- (void)cellHandle {
    
    if (self.detailButton.tag) {
        [self deselectCell];
    } else {
        [self selectCell];
    }
}

- (void)selectCell {
    if (_selectBlock) {
        _selectBlock();
    }
}

- (void)deselectCell {
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = self.originCellFrame;
        
        self.layer.shadowColor = [UIColor clearColor].CGColor;
        self.layer.shadowRadius = 0;
        self.layer.shadowOpacity = 0.0;
        
        self.detailView.layer.shadowColor = [UIColor clearColor].CGColor;
        self.detailView.layer.shadowRadius = 0;
        self.detailView.layer.shadowOpacity = 0.0;
        
        self.detailView.frame = self.originDetailViewFrame;
        self.helperHideView.frame = self.originHelperViewFrame;
        
        [self.detailButton setTitle:@"..." forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        [self.helperHideView removeFromSuperview];
        [self.detailView removeFromSuperview];
        if (_deselectBlock) {
            _deselectBlock();
        }
        self.detailButton.tag = 0;
    }];
}

- (void)selectToShowDetailWithContentOffsetY:(CGFloat)contentOffsetY {
    UIView *superview = self.superview;
    
    CGFloat height = CGRectGetMinY(self.frame) - contentOffsetY + 30;
    [self.helperHideView setFrame:CGRectMake(0, contentOffsetY, CGRectGetWidth(self.frame), height)];
    [superview insertSubview:self.helperHideView belowSubview:self];
    
    self.detailView.indexPath = self.indexPath.row;
    [self.detailView setFrame:CGRectMake(0, CGRectGetMaxY(self.frame) - (kScreenHeight - 100*kScreenRatio - 2*30*kScreenRatio),
                                         CGRectGetWidth(self.frame), kScreenHeight - 100*kScreenRatio - 30*2*kScreenRatio)];
    [superview insertSubview:self.detailView belowSubview:self.helperHideView];
    
    // 改变选中cell的原点值，并给cell增加阴影
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = self.frame;
        self.originCellFrame = rect;
        CGPoint origin = CGPointMake(0, contentOffsetY + 30*kScreenRatio);
        rect.origin = origin;
        self.frame = rect;
        
        CGRect rect2 = self.helperHideView.frame;
        self.originHelperViewFrame = rect2;
        CGPoint origin2 = CGPointMake(0, contentOffsetY + 30*kScreenRatio - height);
        rect2.origin = origin2;
        self.helperHideView.frame = rect2;
        
        CGRect rect1 = self.detailView.frame;
        self.originDetailViewFrame = rect1;
        CGPoint origin1 = CGPointMake(0, 100*kScreenRatio + 30*kScreenRatio + contentOffsetY);
        rect1.origin = origin1;
        self.detailView.frame = rect1;
        
        [self addShadowWithView:self];
        [self addShadowWithView:self.detailView];
        [self.detailButton setTitle:@"×" forState:UIControlStateNormal];
    }];
    
    self.detailButton.tag = 1;
}

- (void)addSelectBlock:(WXYCellSelectBlock)block {
    _selectBlock = block;
}

- (void)addDeselectBlock:(WXYCellDeselectBlock)block {
    _deselectBlock = block;
}

- (void)addShadowWithView:(UIView *)view {
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOpacity:0.3];
    [view.layer setShadowRadius:3.0];
    [view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

@end
