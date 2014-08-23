//
//  MainViewController.m
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (BOOL)hasZipper
{
    return YES;
}

- (BOOL)hasbackInBottomBar
{
    return NO;
}

- (UIButton *)createMenuButton:(SEL)action title:(NSString *)title
{
    UIButton *button = [UIButton menuButton:title target:self action:action];
    [self.view addSubview:button];
    return button;
}

- (void)addOwnViews
{
    [super addOwnViews];
    _scanButton = [self createMenuButton:@selector(onScan:) title:@"扫描"];
    _paymentButton = [self createMenuButton:@selector(onPayment:) title:@"付款申请"];
    _recordButton = [self createMenuButton:@selector(onRecord:) title:@"记录查询"];
    _calculatorButton = [self createMenuButton:@selector(onCalculate:) title:@"计算器"];
    _settingButton = [self createMenuButton:@selector(onSetting:) title:@"设置"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"硬件钱包\n联网端";
}


#define kMenuInterval 20

- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    CGRect rect = self.view.bounds;
    
    NSArray *array = @[_scanButton, _paymentButton, _recordButton, _calculatorButton, _settingButton];
    
    
    rect.origin.y = _zipperView.frame.origin.y;
    rect.origin.x += 40;
    rect.size.width = 160;
   
    CGRect buttonRect = rect;
    buttonRect.size = kMenuSize;
    for (UIButton *button in array)
    {
        button.frame = buttonRect;
        buttonRect.origin.y += buttonRect.size.height + kMenuInterval;
    }
}


- (void)toSkip:(UIButton *)sender class:(Class)aclass
{
    BaseViewController *view = [NSObject loadClass:aclass];
    view.title = [sender titleForState:UIControlStateNormal];
    [[AppDelegate sharedAppDelegate] pushViewController:view];
}

- (void)onScan:(UIButton *)sender
{
    [self toSkip:sender class:[ScanViewController class]];
}

- (void)onPayment:(UIButton *)sender
{
    [self toSkip:sender class:[PaymentViewController class]];
}

- (void)onRecord:(UIButton *)sender
{
    [self toSkip:sender class:[RecordViewController class]];
}

- (void)onCalculate:(UIButton *)sender
{
    [self toSkip:sender class:[CalculatorViewController class]];
}



- (void)onSetting:(UIButton *)sender
{
    [self toSkip:sender class:[SettingViewController class]];
}


@end
