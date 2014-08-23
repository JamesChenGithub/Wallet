//
//  BaseViewController.h
//  TCLSales
//
//  Created by 陈耀武 on 14-1-15.
//  Copyright (c) 2014年 HKConnect. All rights reserved.
//

#import "CommonBaseViewController.h"


//===============================================================
@interface BaseTitleView : UIView
{
    UIImageView *_logoView;
    UILabel *_titleView;
}

- (void)setTitle:(NSString *)title;

@end

//===============================================================

@interface BaseBottomBar : UIView
{
    UIImageView *_logoWebView;
    UIButton *_back;
}

- (void)hideBack:(BOOL)hidden;

@end

//===============================================================


@interface BaseViewController : CommonBaseViewController
{
@protected
    BaseTitleView *_titleView;
    BaseBottomBar *_bottomBar;
    UIImageView *_zipperView;
}

- (void)addTitleView;

- (void)addBottomBar;

- (BOOL)hasZipper;

- (BOOL)hasbackInBottomBar;

@end
