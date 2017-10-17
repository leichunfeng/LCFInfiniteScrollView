//
//  LCFInfiniteScrollView.m
//  LCFInfiniteScrollView
//
//  Created by leichunfeng on 16/4/16.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import "LCFInfiniteScrollView.h"
#import "LCFCollectionViewFlowLayout.h"
#import "LCFCollectionViewCell.h"
#import "UIColor+LCFImageAdditions.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LCFInfiniteScrollView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) LCFCollectionViewFlowLayout *collectionViewLayout;
@property (nonatomic, strong) NSTimer *timer;


@property (nonatomic, strong) NSMutableArray<LCFInfiniteScrollViewItem *> *completeItems;
@property (nonatomic, assign) NSInteger completeMultiplier;

@end

@implementation LCFInfiniteScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.collectionViewLayout = [[LCFCollectionViewFlowLayout alloc] init];
    
    self.collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.collectionViewLayout];
    [self addSubview:self.collectionView];
    
    self.collectionView.backgroundColor  = [UIColor whiteColor];
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    [self.collectionView registerClass:[LCFCollectionViewCell class] forCellWithReuseIdentifier:@"LCFCollectionViewCell"];
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator   = NO;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.itemSize = self.frame.size;
    self.itemSpacing = 0;
    
    _autoscroll = YES;
    _timeInterval = 5;
    
    [self setUpTimer];
    
    self.completeItems = [NSMutableArray array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidChangeStatusBarOrientationNotification:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}

- (void)reportStatus {
    CGPoint point = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMidY(self.collectionView.bounds));
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    if (indexPath == nil) return;
    
    indexPath = [NSIndexPath indexPathForItem:indexPath.row % self.items.count inSection:indexPath.section];
    
    if ([self.delegate respondsToSelector:@selector(infiniteScrollView:didDisplayItemAtIndexPath:)]) {
        [self.delegate infiniteScrollView:self didDisplayItemAtIndexPath:indexPath];
    }
}

- (void)applicationDidChangeStatusBarOrientationNotification:(NSNotification *)notification {
    self.collectionView.contentOffset = [self.collectionViewLayout targetContentOffsetForProposedContentOffset:self.collectionView.contentOffset withScrollingVelocity:CGPointZero];
}

- (void)didMoveToWindow {
    if (self.window == nil) return;
    
    self.collectionView.contentOffset = [self.collectionViewLayout targetContentOffsetForProposedContentOffset:self.collectionView.contentOffset withScrollingVelocity:CGPointZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat chapterLenght = (self.itemSize.width + self.itemSpacing) * self.items.count;
    self.completeMultiplier = floor(self.bounds.size.width / chapterLenght) + 2;
    
    [self.completeItems removeAllObjects];
    for (NSUInteger i = 0; i < self.completeMultiplier; i++) {
        [self.completeItems addObjectsFromArray:self.items];
    }
    
    [self.collectionView reloadData];
    self.collectionView.contentOffset = CGPointMake((self.completeMultiplier / 2) * chapterLenght - self.collectionView.bounds.size.width / 2 + self.itemSize.width / 2, 0);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Getters and Setters

- (UIImage *)placeholderImage {
    if (!_placeholderImage) {
        UIColor *color = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
        _placeholderImage = [color lcf_imageSized:self.itemSize];
    }
    return _placeholderImage;
}

- (void)setItemSize:(CGSize)itemSize {
    _itemSize = itemSize;
    self.collectionViewLayout.itemSize = itemSize;
}

- (void)setItemSpacing:(CGFloat)itemSpacing {
    _itemSpacing = itemSpacing;
    self.collectionViewLayout.minimumLineSpacing = itemSpacing;
}

- (void)setAutoscroll:(BOOL)autoscroll {
    _autoscroll = autoscroll;
    [self setUpTimer];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    _timeInterval = timeInterval;
    [self setUpTimer];
}

#pragma mark - Timer

- (void)setUpTimer {
    [self tearDownTimer];
    
    if (!self.autoscroll) return;
    
    self.timer = [NSTimer timerWithTimeInterval:self.timeInterval
                                         target:self
                                       selector:@selector(timerFire:)
                                       userInfo:nil
                                        repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)tearDownTimer {
    [self.timer invalidate];
}

- (void)timerFire:(NSTimer *)timer {
    CGFloat currentOffset = self.collectionView.contentOffset.x;
    CGFloat targetOffset  = currentOffset + self.itemSize.width + self.itemSpacing;
    
    [self.collectionView setContentOffset:CGPointMake(targetOffset, self.collectionView.contentOffset.y) animated:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.completeItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LCFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LCFCollectionViewCell" forIndexPath:indexPath];
    
    LCFInfiniteScrollViewItem *item = self.completeItems[indexPath.row];
    
    if (item.imageName) {
        [cell.imageView setImage:[UIImage imageNamed:item.imageName]];
    } else {
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.imageURL] placeholderImage:self.placeholderImage];
    }
    
    cell.label.text = item.text;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectItemAtIndex) {
        self.didSelectItemAtIndex(indexPath.row % self.completeItems.count);
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.itemSize.width + self.itemSpacing;
    CGFloat periodOffset = pageWidth * self.items.count;
    CGFloat offsetActivatingMoveToBegin = pageWidth * self.completeItems.count - scrollView.bounds.size.width;
    CGFloat offsetActivatingMoveToEnd = 0;

    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX > offsetActivatingMoveToBegin) {
        scrollView.contentOffset = CGPointMake((offsetX - periodOffset), 0);
    } else if (offsetX < offsetActivatingMoveToEnd) {
        scrollView.contentOffset = CGPointMake((offsetX + periodOffset), 0);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self tearDownTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setUpTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self reportStatus];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self reportStatus];
    
    self.collectionView.contentOffset = [self.collectionViewLayout targetContentOffsetForProposedContentOffset:self.collectionView.contentOffset withScrollingVelocity:CGPointZero];
}

@end
