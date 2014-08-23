//
//  BaseViewController.m
//  TCLSales
//
//  Created by 陈耀武 on 14-1-15.
//  Copyright (c) 2014年 HKConnect. All rights reserved.
//

#import "BaseViewController.h"

//===============================================================

@implementation BaseTitleView

- (void)addOwnViews
{
    _logoView = [[UIImageView alloc] init];
    _logoView.image = [UIImage imageNamed:@"titlebar.png"];
    [self addSubview:_logoView];
    
    _titleView = [[UILabel alloc] init];
    _titleView.backgroundColor = kClearColor;
    _titleView.textAlignment = NSTextAlignmentCenter;
    _titleView.numberOfLines = 0;
    _titleView.lineBreakMode = NSLineBreakByWordWrapping;
    _titleView.textColor = RGB(30, 70, 90);
    _titleView.adjustsFontSizeToFitWidth = YES;
    _titleView.font = [UIFont boldSystemFontOfSize:20.0];
//    _titleView.backgroundColor = kRedColor;
    [self addSubview:_titleView];
}


- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.bounds;
    _logoView.frame = rect;
    
    [_titleView sizeWith:CGSizeMake(140, rect.size.height)];
    [_titleView alignParentRight];
}

- (void)setTitle:(NSString *)title
{
    _titleView.text = title;
}
@end

//===============================================================

@implementation BaseBottomBar

- (void)addOwnViews
{
    _logoWebView = [[UIImageView alloc] init];
    _logoWebView.image = [UIImage imageNamed:@"bottombar.png"];
    [self addSubview:_logoWebView];
    
    _back = [UIButton menuButton:@"返回" target:self action:@selector(onBack)];
    [self addSubview:_back];
}

- (void)onBack
{
    [[AppDelegate sharedAppDelegate] popViewController];
}

- (void)hideBack:(BOOL)hidden
{
    _back.hidden = hidden;
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.bounds;
    _logoWebView.frame = rect;
    
    [_back sizeWith:CGSizeMake(80, 44)];
    [_back alignParentLeftWithMargin:10];
    [_back layoutParentVerticalCenter];
}


@end

//===============================================================

@implementation BaseViewController

- (BOOL)hasBackgroundView
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.navigationController.navigationBar.hidden = YES;
}

- (void)addTitleView
{
    _titleView = [[BaseTitleView alloc] init];
    [self.view addSubview:_titleView];
    
}

- (void)addBottomBar
{
    _bottomBar = [[BaseBottomBar alloc] init];
    [self.view addSubview:_bottomBar];
}

- (void)configBackground
{
    _backgroundView.image = [UIImage imageNamed:@"contentbg.png"];
}

- (BOOL)hasZipper
{
    return NO;
}

- (void)addZipper
{
    _zipperView = [[UIImageView alloc] init];
    _zipperView.image = [UIImage imageNamed:@"zipper.png"];
    [self.view addSubview:_zipperView];
}

- (void)addOwnViews
{
    [self addTitleView];
    
    if ([self hasZipper])
    {
        [self addZipper];
    }
    
    [self addBottomBar];
}

- (void)onBack
{
    [[AppDelegate sharedAppDelegate] popViewController];
}


- (BOOL)hasbackInBottomBar
{
    return YES;
}

- (void)configOwnViews
{
    [_titleView setTitle:self.title];
}

#define kTitleHeight 80
#define kBottomBarHeight 50
- (void)layoutOnIPhone
{
    CGRect rect = self.view.bounds;
    [_titleView setFrameAndLayout:CGRectMake(0, 0, rect.size.width, kTitleHeight)];

    
    [_bottomBar setFrameAndLayout:CGRectMake(0, rect.size.height - kBottomBarHeight, rect.size.width, kBottomBarHeight)];
    
    _backgroundView.frame = CGRectMake(0, kTitleHeight, rect.size.width, rect.size.height - kTitleHeight - kBottomBarHeight);
    
    if (_zipperView)
    {
        [_zipperView sizeWith:CGSizeMake(45, 180)];
        [_zipperView layoutBelow:_titleView margin:[IOSDeviceConfig sharedConfig].isIPhone4 ? 20 : 40];
        [_zipperView alignParentRightWithMargin:40];
    }
    
    [_bottomBar hideBack:![self hasbackInBottomBar]];
    
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    [_titleView setTitle:title];
}

@end
