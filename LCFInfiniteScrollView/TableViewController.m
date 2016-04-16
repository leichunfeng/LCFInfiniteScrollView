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

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGSize itemSize = CGSizeZero;
    CGFloat itemSpacing = 0;
    NSArray<NSString *> *imageURLs = nil;
    
    if ([SDVersion deviceSize] == Screen3Dot5inch ||
        [SDVersion deviceSize] == Screen4inch) {
        itemSize = CGSizeMake(640.0 / 2, 260.0 / 2);
        itemSpacing = 0;
        
        imageURLs = @[
            @"http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_640_260_2x.jpeg",
            @"http://a3.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_640_260_2x.jpeg",
            @"http://a1.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_640_260_2x.jpeg",
            @"http://a2.mzstatic.com/us/r30/Features69/v4/09/83/bf/0983bfcf-52e2-8e16-5541-7cd7e3a10c9e/flowcase_640_260_2x.jpeg",
            @"http://a2.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_640_260_2x.jpeg",
            @"http://a4.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_640_260_2x.jpeg",
        ];
    } else if ([SDVersion deviceSize] == Screen4Dot7inch) {
        itemSize = CGSizeMake(750.0 / 2, 304.0 / 2);
        itemSpacing = 0;
        
        imageURLs = @[
            @"http://a5.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_750_304_2x.jpeg",
            @"http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_750_304_2x.jpeg",
            @"http://a4.mzstatic.com/us/r30/Features69/v4/09/83/bf/0983bfcf-52e2-8e16-5541-7cd7e3a10c9e/flowcase_750_304_2x.jpeg",
            @"http://a3.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_750_304_2x.jpeg",
            @"http://a4.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_750_304_2x.jpeg",
            @"http://a1.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_750_304_2x.jpeg",
        ];
    } else if ([SDVersion deviceSize] == Screen5Dot5inch) {
        itemSize = CGSizeMake(796.0 / 3, 390.0 / 3);
        itemSpacing = 5;
        
        imageURLs = @[
            @"http://a2.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_796_390_2x.jpeg",
            @"http://a1.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_796_390_2x.jpeg",
            @"http://a3.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_796_390_2x.jpeg",
            @"http://a1.mzstatic.com/us/r30/Features69/v4/09/83/bf/0983bfcf-52e2-8e16-5541-7cd7e3a10c9e/flowcase_796_390_2x.jpeg",
            @"http://a5.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_796_390_2x.jpeg",
            @"http://a1.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_796_390_2x.jpeg",
        ];
    } else {
        itemSize = CGSizeMake(1060.0 / 2, 520.0 / 2);
        itemSpacing = 5;
        
        imageURLs = @[
            @"http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_1060_520_2x.jpeg",
            @"http://a3.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_1060_520_2x.jpeg",
            @"http://a5.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_1060_520_2x.jpeg",
            @"http://a5.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_1060_520_2x.jpeg",
            @"http://a3.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_1060_520_2x.jpeg",
            @"http://a3.mzstatic.com/us/r30/Features49/v4/91/27/09/91270995-de9f-9afe-5b52-ab4f7ca1a37e/flowcase_1060_520_2x.jpeg",
        ];
    }
    
    NSMutableArray<LCFInfiniteScrollViewItem *> *items = [[NSMutableArray alloc] init];
    
    for (NSString *imageURL in imageURLs) {
        LCFInfiniteScrollViewItem *item = [[LCFInfiniteScrollViewItem alloc] initWithImageURL:imageURL imageText:nil];
        [items addObject:item];
    }

    LCFInfiniteScrollView *infiniteScrollView = [[LCFInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth([UIScreen mainScreen].bounds), itemSize.height)];
    self.tableView.tableHeaderView = infiniteScrollView;

    infiniteScrollView.itemSize = itemSize;
    infiniteScrollView.itemSpacing = itemSpacing;

    infiniteScrollView.items = items.copy;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];

    // Configure the cell...

    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
