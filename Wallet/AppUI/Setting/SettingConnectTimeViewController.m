//
//  SettingConnectTimeViewController.m
//  Wallet
//
//  Created by James on 14-7-18.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "SettingConnectTimeViewController.h"

@interface SettingConnectTimeViewController ()

@end

@implementation SettingConnectTimeViewController

- (void)addOwnViews
{
    [super addOwnViews];
    
    _connectTimeTip = [[UILabel alloc] init];
    _connectTimeTip.textColor = kWhiteColor;
    _connectTimeTip.backgroundColor = kClearColor;
    _connectTimeTip.font = [UIFont boldSystemFontOfSize:16];
    _connectTimeTip.text = @"连接超时时间：";
    [self.view addSubview:_connectTimeTip];
    
    _connectTime = [[UILabel alloc] init];
    _connectTime.textColor = kWhiteColor;
    _connectTime.backgroundColor = kClearColor;
    _connectTime.font = [UIFont boldSystemFontOfSize:16];
    _connectTime.text = @"默认";
    [self.view addSubview:_connectTime];
    
    
    _connectTimeDefaultButton = [UIButton menuButton:@"默认值" target:self action:@selector(onDefaultConnectTime:)];
    [self.view addSubview:_connectTimeDefaultButton];
    
    _connectTimeSlider = [[UISlider alloc] init];
    _connectTimeSlider.maximumValue = 80;
    _connectTimeSlider.minimumValue = 20;
    [_connectTimeSlider addTarget:self action:@selector(onConnectTimeChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_connectTimeSlider];
    
    
    _connectCountTip = [[UILabel alloc] init];
    _connectCountTip.textColor = kWhiteColor;
    _connectCountTip.backgroundColor = kClearColor;
    _connectCountTip.font = [UIFont boldSystemFontOfSize:16];
    _connectCountTip.text = @"重新连接次数：";
    [self.view addSubview:_connectCountTip];
    
    _connectCount = [[UILabel alloc] init];
    _connectCount.textColor = kWhiteColor;
    _connectCount.backgroundColor = kClearColor;
    _connectCount.font = [UIFont boldSystemFontOfSize:16];
    _connectCount.text = @"默认";
    [self.view addSubview:_connectCount];
    
    
    _connectCountDefaultButton = [UIButton menuButton:@"默认值" target:self action:@selector(onDefaultConnectCount:)];
    [self.view addSubview:_connectCountDefaultButton];
    
    _connectCountSlider = [[UISlider alloc] init];
    _connectCountSlider.maximumValue = 10;
    _connectCountSlider.minimumValue = 2;
    [_connectCountSlider addTarget:self action:@selector(onConnectCountChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_connectCountSlider];
    
    
    
    _cancelButton = [UIButton menuButton:@"取消" target:self action:@selector(onCancel:)];
    [self.view addSubview:_cancelButton];
    
    _confirmButton = [UIButton menuButton:@"确认" target:self action:@selector(onConfirm:)];
    [self.view addSubview:_confirmButton];
}

- (void)onDefaultConnectTime:(UIButton *)button
{
    
}

- (void)onDefaultConnectCount:(UIButton *)button
{
    
}



- (void)onConnectTimeChanged:(UISlider *)slider
{
    _connectTime.text = [NSString stringWithFormat:@"%ld", (long)(slider.value)];
}

- (void)onConnectCountChanged:(UISlider *)slider
{
    _connectCount.text = [NSString stringWithFormat:@"%ld", (long)(slider.value)];
}

- (void)onDefault:(UIButton *)btn
{
    
}

- (void)onCancel:(UIButton *)btn
{
    
}

- (void)onConfirm:(UIButton *)btn
{
    
}

#define kHorMargin 20

- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    
    CGRect rect = _backgroundView.frame;
    
    CGSize size = rect.size;
    size.width -= 2*kHorMargin;
    
    
    [_connectTimeTip sizeWith:CGSizeMake(120, 30)];
    [_connectTimeTip layoutBelow:_titleView margin:30];
    [_connectTimeTip alignParentLeftWithMargin:kHorMargin];
    
    [_connectTime sizeWith:CGSizeMake(80, 30)];
    [_connectTime alignTop:_connectTimeTip];
    [_connectTime layoutToRightOf:_connectTimeTip];
    [_connectTime layoutToRightOf:_connectTimeTip];
    
    [_connectTimeDefaultButton sizeWith:CGSizeMake(80, kMenuSize.height)];
    [_connectTimeDefaultButton layoutToRightOf:_connectTime];
    [_connectTimeDefaultButton alignVerticalCenterOf:_connectTimeTip];
    
    [_connectTimeSlider sizeWith:CGSizeMake(size.width, 30)];
    [_connectTimeSlider layoutBelow:_connectTimeTip margin:20];
    [_connectTimeSlider alignParentLeftWithMargin:kHorMargin];
    
    
    [_connectCountTip sameWith:_connectTimeTip];
    [_connectCountTip layoutBelow:_connectTimeSlider margin:30];

    [_connectCount sameWith:_connectTime];
    [_connectCount layoutBelow:_connectTimeSlider margin:30];
    
    [_connectCountDefaultButton sameWith:_connectTimeDefaultButton];
    [_connectCountDefaultButton layoutBelow:_connectTimeSlider margin:30];
    
    [_connectCountSlider sameWith:_connectTimeSlider];
    [_connectCountSlider layoutBelow:_connectCountTip margin:20];
    
    [_cancelButton sizeWith:CGSizeMake(120, kMenuSize.height)];
    [_cancelButton alignParentLeftWithMargin:kHorMargin];
    [_cancelButton layoutBelow:_connectCountSlider margin:20];
    
    [_confirmButton sameWith:_cancelButton];
    [_confirmButton alignParentRightWithMargin:kHorMargin];
    
    
    
}


@end
