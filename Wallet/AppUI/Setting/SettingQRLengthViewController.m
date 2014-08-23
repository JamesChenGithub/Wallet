//
//  SettingQRLengthViewController.m
//  Wallet
//
//  Created by James on 14-7-18.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "SettingQRLengthViewController.h"

@interface SettingQRLengthViewController ()

@end

@implementation SettingQRLengthViewController

- (void)addOwnViews
{
    [super addOwnViews];
    
    _qrLengthTip = [[UILabel alloc] init];
    _qrLengthTip.textColor = kWhiteColor;
    _qrLengthTip.backgroundColor = kClearColor;
    _qrLengthTip.font = [UIFont boldSystemFontOfSize:16];
    _qrLengthTip.text = @"二维码长度：";
    [self.view addSubview:_qrLengthTip];
    
    _qrLength = [[UILabel alloc] init];
    _qrLength.textColor = kWhiteColor;
    _qrLength.backgroundColor = kClearColor;
    _qrLength.font = [UIFont boldSystemFontOfSize:16];
    _qrLength.text = @"默认";
    [self.view addSubview:_qrLength];
    
    _qrSlider = [[UISlider alloc] init];
    _qrSlider.maximumValue = 80;
    _qrSlider.minimumValue = 20;
    [_qrSlider addTarget:self action:@selector(onQRLengthChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_qrSlider];
    
    _defaultButton = [UIButton menuButton:@"默认值" target:self action:@selector(onDefault:)];
    [self.view addSubview:_defaultButton];
    
    _cancelButton = [UIButton menuButton:@"取消" target:self action:@selector(onCancel:)];
    [self.view addSubview:_cancelButton];
    
    _confirmButton = [UIButton menuButton:@"确认" target:self action:@selector(onConfirm:)];
    [self.view addSubview:_confirmButton];
}

- (void)onQRLengthChanged:(UISlider *)slider
{
    _qrLength.text = [NSString stringWithFormat:@"%ld", (long)(slider.value)];
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
    
    
    [_qrLengthTip sizeWith:CGSizeMake(size.width/2, 30)];
    [_qrLengthTip layoutBelow:_titleView margin:30];
    [_qrLengthTip alignParentLeftWithMargin:kHorMargin];
    
    [_qrLength sameWith:_qrLengthTip];
    [_qrLength layoutToRightOf:_qrLengthTip];
    
    [_qrSlider sizeWith:CGSizeMake(size.width, 30)];
    [_qrSlider layoutBelow:_qrLength margin:20];
    [_qrSlider alignParentLeftWithMargin:kHorMargin];
    
    [_defaultButton sizeWith:CGSizeMake(120, kMenuSize.height)];
    [_defaultButton layoutParentHorizontalCenter];
    [_defaultButton layoutBelow:_qrSlider margin:40];
    
    [_cancelButton sameWith:_defaultButton];
    [_cancelButton alignParentLeftWithMargin:kHorMargin];
    [_cancelButton layoutBelow:_defaultButton margin:20];
    
    [_confirmButton sameWith:_cancelButton];
    [_confirmButton alignParentRightWithMargin:kHorMargin];
    
    
    
}

@end
