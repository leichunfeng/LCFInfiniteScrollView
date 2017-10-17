//
//  TableViewController.m
//  LCFInfiniteScrollView
//
//  Created by leichunfeng on 16/4/16.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import "TableViewController.h"
#import "LCFInfiniteScrollView.h"
#import "SDVersion.h"
#import "UIColor+LCFImageAdditions.h"

@interface TableViewController () <LCFInfiniteScrollViewDelegate>

@property (nonatomic, strong) LCFInfiniteScrollView *infiniteScrollView;

@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat itemSpacing;

@property (nonatomic, copy) NSArray<LCFInfiniteScrollViewItem *> *items;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.infiniteScrollView = [[LCFInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), self.itemSize.height)];
    self.tableView.tableHeaderView = self.infiniteScrollView;

    self.infiniteScrollView.itemSize = self.itemSize;
    self.infiniteScrollView.itemSpacing = self.itemSpacing;
    
    self.infiniteScrollView.autoscroll = YES;
    self.infiniteScrollView.timeInterval = 1.5;
    
    UIColor *color = [UIColor colorWithRed:237 / 255.0 green:237 / 255.0 blue:237 / 255.0 alpha:1];
    self.infiniteScrollView.placeholderImage = [color lcf_imageSized:self.itemSize];
    
    self.infiniteScrollView.didSelectItemAtIndex = ^(NSUInteger index) {
        NSLog(@"didSelectItemAtIndex: %@", @(index));
    };
    
    self.infiniteScrollView.delegate = self;

    self.infiniteScrollView.items = self.items;
}

- (CGSize)itemSize {
    if ([SDVersion deviceSize] == Screen3Dot5inch || [SDVersion deviceSize] == Screen4inch) {
        return CGSizeMake(320, 130);
    } else if ([SDVersion deviceSize] == Screen4Dot7inch) {
        return CGSizeMake(375, 152);
    } else if ([SDVersion deviceSize] == Screen5Dot5inch) {
        return CGSizeMake(265.333, 130);
    } else {
        return CGSizeMake(530, 260);
    }
}

- (CGFloat)itemSpacing {
    if ([SDVersion deviceSize] == Screen3Dot5inch || [SDVersion deviceSize] == Screen4inch) {
        return 0;
    } else if ([SDVersion deviceSize] == Screen4Dot7inch) {
        return 0;
    } else if ([SDVersion deviceSize] == Screen5Dot5inch) {
        return 5;
    } else {
        return 5;
    }
}

- (NSArray *)items {
    NSArray *imageURLs = nil;

    if ([SDVersion deviceSize] == Screen3Dot5inch || [SDVersion deviceSize] == Screen4inch) {
        imageURLs = @[
            @"http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_640_260_2x.jpeg",
//            @"http://a3.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_640_260_2x.jpeg",
//            @"http://a1.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_640_260_2x.jpeg",
//            @"http://a2.mzstatic.com/us/r30/Features69/v4/09/83/bf/0983bfcf-52e2-8e16-5541-7cd7e3a10c9e/flowcase_640_260_2x.jpeg",
//            @"http://a2.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_640_260_2x.jpeg",
//            @"http://a4.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_640_260_2x.jpeg",
        ];
    } else if ([SDVersion deviceSize] == Screen4Dot7inch) {
        imageURLs = @[
            @"http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_750_304_2x.jpeg",
//            @"http://a5.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_750_304_2x.jpeg",
//            @"http://a3.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_750_304_2x.jpeg",
//            @"http://a4.mzstatic.com/us/r30/Features69/v4/09/83/bf/0983bfcf-52e2-8e16-5541-7cd7e3a10c9e/flowcase_750_304_2x.jpeg",
//            @"http://a4.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_750_304_2x.jpeg",
//            @"http://a1.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_750_304_2x.jpeg",
        ];
    } else if ([SDVersion deviceSize] == Screen5Dot5inch) {
        imageURLs = @[
            @"http://a1.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_796_390_2x.jpeg",
//            @"http://a2.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_796_390_2x.jpeg",
//            @"http://a5.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_796_390_2x.jpeg",
//            @"http://a1.mzstatic.com/us/r30/Features69/v4/09/83/bf/0983bfcf-52e2-8e16-5541-7cd7e3a10c9e/flowcase_796_390_2x.jpeg",
//            @"http://a1.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_796_390_2x.jpeg",
//            @"http://a3.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_796_390_2x.jpeg",
        ];
    } else {
        imageURLs = @[
            @"http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_1060_520_2x.jpeg",
//            @"http://a3.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_1060_520_2x.jpeg",
//            @"http://a5.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_1060_520_2x.jpeg",
//            @"http://a3.mzstatic.com/us/r30/Features49/v4/91/27/09/91270995-de9f-9afe-5b52-ab4f7ca1a37e/flowcase_1060_520_2x.jpeg",
//            @"http://a3.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_1060_520_2x.jpeg",
//            @"http://a5.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_1060_520_2x.jpeg",
        ];
    }

    NSMutableArray *items = [[NSMutableArray alloc] init];

    for (NSString *imageURL in imageURLs) {
        LCFInfiniteScrollViewItem *item = [LCFInfiniteScrollViewItem itemWithImageURL:imageURL text:nil];
        [items addObject:item];
    }

    return items.copy;
}

#pragma mark - LCFInfiniteScrollViewDelegate

- (void)infiniteScrollView:(LCFInfiniteScrollView *)infiniteScrollView didDisplayItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", @(indexPath.row));
}

@end
