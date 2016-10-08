//
//  ViewController.m
//  CollocationView
//
//  Created by 郭伟文 on 16/8/15.
//  Copyright © 2016年 郭伟文. All rights reserved.
//

#import "ViewController.h"
#import "ButtonCollectionViewCell.h"

#define KButtonWitdh [UIScreen mainScreen].bounds.size.width/4
#define KButtonHeight 30

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

static NSString *ButtonCollectionViewCellIdentifier = @"CollectionViewCell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *lotteryLayout = [[UICollectionViewFlowLayout alloc] init];
    lotteryLayout.itemSize = CGSizeMake(KButtonWitdh, KButtonHeight);
    lotteryLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
    lotteryLayout.sectionInset = UIEdgeInsetsZero;
    lotteryLayout.minimumLineSpacing = 0;
    lotteryLayout.minimumInteritemSpacing = 1;
    self.collectionView.collectionViewLayout = lotteryLayout;
    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.showsHorizontalScrollIndicator = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ButtonCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ButtonCollectionViewCellIdentifier];
    [self.collectionView reloadData];
}

#pragma -mark CollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ButtonCollectionViewCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index.row = %ld , index.section = %ld",indexPath.row,indexPath.section);
}


@end
