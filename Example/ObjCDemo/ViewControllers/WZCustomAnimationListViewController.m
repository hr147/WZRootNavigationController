//
//  WZCustomAnimationListViewController.m
//  ObjCDemo
//
//  Created by 吴哲 on 2018/5/11.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

#import "WZCustomAnimationListViewController.h"

@interface WZCustomAnimationListViewController ()

@end

@implementation WZCustomAnimationListViewController

static NSString * const reuseIdentifier = @"cell";

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat w = (self.view.frame.size.width - 10.0 * 4) / 3.0;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake(w, w);
    layout.minimumLineSpacing = 9.0f;
    layout.minimumInteritemSpacing = 9.0f;
    layout.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WZCustomAnimatedListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.backgroundColor = WZRandomColor;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        WZCustomAnimatedListHeadView *headView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        headView.imageView.backgroundColor = WZRandomColor;
        return headView;
    }
    return [UICollectionReusableView new];
}

@end
