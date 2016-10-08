//
//  XHHorizontalPageViewController.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHHorizontalPageViewController.h"

#import "XHHorizontalPageViewCell.h"

#import "UICollectionView+XHIndexPath.h"

#define kXHHorizontalPageViewCellIdentify @"XHHorizontalPageViewCellIdentify"

@interface XHHorizontalPageViewController ()

@property (nonatomic, assign) CGPoint pullOffset;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation XHHorizontalPageViewController

#pragma mark - Propertys

- (UICollectionView *)collectionView {
    if (!_collectionView){
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.collectionViewFlowLayout];
        [_collectionView setScrollsToTop:NO];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[XHHorizontalPageViewCell class] forCellWithReuseIdentifier:kXHHorizontalPageViewCellIdentify];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[XHHorizontalPageViewCell class] forCellWithReuseIdentifier:kXHHorizontalPageViewCellIdentify];
        [_collectionView setCurrentIndexPath:self.indexPath];
        
        [_collectionView performBatchUpdates:^{
            [_collectionView reloadData];
        } completion:^(BOOL finished) {
            if (finished) {
                [self.collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
            }
        }];
    }
    return _collectionView;
}

#pragma mark - Life Cycle

- (instancetype)initWithCollectionViewFlowLayout:(UICollectionViewFlowLayout *)collectionViewFlowLayout currentIndexPath:(NSIndexPath *)indexPath {
    self = [super init];
    if (self) {
        self.pullOffset = CGPointZero;
        self.collectionViewFlowLayout = collectionViewFlowLayout;
        self.indexPath = indexPath;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

#pragma mark - XHTransitionProtocol

- (CGPoint)pageViewCellScrollViewContentOffset {
    return self.pullOffset;
}

- (UICollectionView *)transitionCollectionView {
    return self.collectionView;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (index == 0) {
        self.indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.collectionView setCurrentIndexPath:self.indexPath];
    }
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XHHorizontalPageViewCell *collectionCell = (XHHorizontalPageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kXHHorizontalPageViewCellIdentify forIndexPath:indexPath];
    collectionCell.pinterest = self.items[indexPath.row];
    collectionCell.didSelectedSubItemAction = ^(XHPinterest *currentPinterest) {
        
    };
    __weak typeof(self) weakSelf = self;
    collectionCell.pullDownAction = ^(CGPoint offset) {
        weakSelf.pullOffset = offset;
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [collectionCell setNeedsDisplay];
    return collectionCell;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com