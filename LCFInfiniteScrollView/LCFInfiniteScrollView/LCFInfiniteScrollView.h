//
//  LCFInfiniteScrollView.h
//  LCFInfiniteScrollView
//
//  Created by leichunfeng on 16/4/16.
//  Copyright © 2016年 leichunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCFInfiniteScrollViewItem.h"

@interface LCFInfiniteScrollView : UIView

@property (nonatomic, copy) NSArray<LCFInfiniteScrollViewItem *> *items;

@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat itemSpacing;

@end
