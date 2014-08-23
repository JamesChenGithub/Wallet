//
//  ScanResultsViewController.h
//  Wallet
//
//  Created by James on 14-7-14.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface ScanResultsViewController : BaseViewController<PageScrollViewDelegate>
{
    UILabel *_scanTip;
    PageScrollView *_resultsScrollView;
    
    UIButton *_previous;
    UILabel *_pageIndexTip;
    UIButton *_next;
    
    NSMutableArray *_pages;
}

@property (nonatomic, strong) NSMutableArray *scanResultArray;   // 扫描结果分出来的子串
@end
