//
//  SettingViewController.m
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (BOOL)hasZipper
{
    return YES;
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
    
    _connectTime = [self createMenuButton:@selector(onConnectTime:) title:@"连接时间设置"];
    _fee = [self createMenuButton:@selector(onFee:) title:@"手续费"];
    _qrLength = [self createMenuButton:@selector(onQRLength:) title:@"二维码长度"];
    _transcation = [self createMenuButton:@selector(onTranscation:) title:@"交易验证强度"];
    _about = [self createMenuButton:@selector(onAbout:) title:@"关于"];
    _instruction = [self createMenuButton:@selector(onInstruction:) title:@"说明书"];
}

#define kMenuInterval 10

- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    CGRect rect = self.view.bounds;
    
    NSArray *array = @[_connectTime, _fee, _qrLength, _transcation, _about, _instruction];
    
    
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

- (NSString *)nextTitleOf:(UIButton *)btn
{
    return [NSString stringWithFormat:@"%@\n%@", self.title, [btn titleForState:UIControlStateNormal]];
}


- (void)toSkip:(UIButton *)sender class:(Class)aclass
{
    BaseViewController *view = [NSObject loadClass:aclass];
    view.title = [self nextTitleOf:sender];
    [[AppDelegate sharedAppDelegate] pushViewController:view];
}

- (void)onConnectTime:(UIButton *)sender
{
    [self toSkip:sender class:[SettingConnectTimeViewController class]];
}

- (void)onFee:(UIButton *)sender
{
    [self toSkip:sender class:[SettingFeeViewController class]];
}

- (void)onQRLength:(UIButton *)sender
{
    [self toSkip:sender class:[SettingQRLengthViewController class]];
}

- (void)onTranscation:(UIButton *)sender
{
    [self toSkip:sender class:[BaseViewController class]];
}

- (void)onAbout:(UIButton *)sender
{
    [self toSkip:sender class:[BaseViewController class]];
}

- (void)onInstruction:(UIButton *)sender
{
    [self toSkip:sender class:[BaseViewController class]];
}

@end
