//
//  ScanResultsViewController.m
//  Wallet
//
//  Created by James on 14-7-14.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "ScanResultsViewController.h"

@interface ScanResultsViewController ()

@end

@implementation ScanResultsViewController


- (void)onPrevious:(UIButton *)button
{
    if (_resultsScrollView.pageIndex - 1 >= 0)
    {
        [_resultsScrollView scrollTo:_resultsScrollView.pageIndex - 1];
    }
}

- (void)onNext:(UIButton *)button
{
    if (_resultsScrollView.pageIndex + 1 < _pages.count)
    {
        [_resultsScrollView scrollTo:_resultsScrollView.pageIndex + 1];
    }
}

- (void)addOwnViews
{
    [super addOwnViews];
    
    _scanTip = [[UILabel alloc] init];
    _scanTip.backgroundColor = kClearColor;
    _scanTip.textColor = kWhiteColor;
    _scanTip.font = [UIFont boldSystemFontOfSize:24];
    _scanTip.text = @"请扫描注册码";
    [self.view addSubview:_scanTip];
    

    _resultsScrollView = [[PageScrollView alloc] init];
    _resultsScrollView.delegate = self;
    [self.view addSubview:_resultsScrollView];
    
    _previous = [UIButton menuButton:@"上一页" target:self action:@selector(onPrevious:)];
    [self.view addSubview:_previous];
    
    _pageIndexTip = [[UILabel alloc] init];
    _pageIndexTip.backgroundColor = kClearColor;
    _pageIndexTip.textColor = kWhiteColor;
    _pageIndexTip.font = [UIFont boldSystemFontOfSize:16];
    _pageIndexTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_pageIndexTip];
    
    _next = [UIButton menuButton:@"下一页" target:self action:@selector(onNext:)];
    [self.view addSubview:_next];
}

- (void)configOwnViews
{
    self.title = @"扫描之后";
    [[HUDHelper sharedInstance] loading];
//    dispatch_async(dispatch_get_main_queue(), ^{
    
        _pages = [NSMutableArray array];
        
        
        for (id res in _scanResultArray)
        {
            UIImageView *view = [[UIImageView alloc] init];
            view.contentMode = UIViewContentModeScaleAspectFit;
            view.image = [self makeRQCodeImage:res];
            [_pages addObject:view];
        }
        
//        dispatch_async(dispatch_get_main_queue(), ^{
            [[HUDHelper sharedInstance] stopLoading];
//            [self layoutOnIPhone];
//        });
//    });
    
    _resultsScrollView.scrollView.scrollEnabled = NO;
}

- (UIImage *)makeRQCodeImage:(id)textOrBytes
{
    // 生成txt.text的二维码
    NSError* error = nil;
    ZXMultiFormatWriter* writer = [ZXMultiFormatWriter writer];
    
    ZXEncodeHints* hints = [ZXEncodeHints hints];
    hints.errorCorrectionLevel = [ZXErrorCorrectionLevel errorCorrectionLevelH];//容错性设成最高，二维码里添加图片
    hints.encoding =  NSUTF8StringEncoding;// 加上这两句，可以用中文了
    
    ZXBitMatrix* result = [writer encode:[textOrBytes description] format:kBarcodeFormatQRCode width:560 height:560 hints:hints error:&error];
    /* ZXBitMatrix* result = [writer encode:self.txt.text
     format:kBarcodeFormatQRCode    //编码
     width:500  //图片大小
     height:500
     error:&error];
     */
    if (result)
    {
        CGImageRef imageRef = [[ZXImage imageWithMatrix:result] cgimage];
        UIImage *qrImage =   [UIImage imageWithCGImage:imageRef];//二维码原图
        return qrImage;
    }
    else
    {
        return nil;
    }
}

#define kScanTipHeight 30
#define kQRImageHeight 280


- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    
    CGRect bounds = _backgroundView.frame;
    
    [_scanTip sizeWith:CGSizeMake(240, kScanTipHeight)];
    [_scanTip layoutParentHorizontalCenter];
    [_scanTip layoutBelow:_titleView];

    
    [_previous sizeWith:CGSizeMake(100, kMenuSize.height)];
    [_previous alignParentLeftWithMargin:10];
    [_previous layoutAbove:_bottomBar margin:10];
    
    [_next sameWith:_previous];
    [_next alignParentRightWithMargin:10];
    
    [_pageIndexTip sameWith:_previous];
    [_pageIndexTip layoutToRightOf:_previous margin:10];
    [_pageIndexTip scaleToLeftOf:_next margin:10];
    
    CGRect rect = CGRectMake(0, _scanTip.frame.origin.y + _scanTip.frame.size.height, bounds.size.width, _previous.frame.origin.y - (_scanTip.frame.origin.y + _scanTip.frame.size.height) - 10);

    if (_pages.count)
    {
        [_resultsScrollView setFrameAndLayout:rect withPages:_pages];
        [_resultsScrollView scrollTo:0];
        _pageIndexTip.text = [NSString stringWithFormat:@"%d/%lu", 1, (unsigned long)_pages.count];
    }
    else
    {
        [_resultsScrollView setFrameAndLayout:rect];
    }
    
}

- (void)onPageScrollView:(PageScrollView *)pageView scrollToPage:(NSInteger)pageIndex
{
    _pageIndexTip.text = [NSString stringWithFormat:@"%ld/%ld", (long)pageIndex+1, (long)pageView.pages.count];
}


@end
