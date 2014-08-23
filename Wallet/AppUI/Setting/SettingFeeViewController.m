//
//  SettingFeeViewController.m
//  Wallet
//
//  Created by James on 14-7-17.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "SettingFeeViewController.h"

@interface SettingFeeViewController ()

@end

@implementation SettingFeeViewController

- (void)addOwnViews
{
    [super addOwnViews];
    
    _upperLimitTip = [[UILabel alloc] init];
    _upperLimitTip.textColor = kWhiteColor;
    _upperLimitTip.backgroundColor = kClearColor;
    _upperLimitTip.font = [UIFont boldSystemFontOfSize:16];
    _upperLimitTip.text = @"手续费上限";
    [self.view addSubview:_upperLimitTip];
    
    _upperEdit = [[UITextField alloc] init];
    _upperEdit.backgroundColor = kWhiteColor;
    _upperEdit.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_upperEdit];
    
    _upperBTCButton = [[UIButton alloc] init];
    [_upperBTCButton setImage:[UIImage imageNamed:@"btc.png"] forState:UIControlStateNormal];
    [self.view addSubview:_upperBTCButton];

    _lowerLimitTip = [[UILabel alloc] init];
    _lowerLimitTip.textColor = kWhiteColor;
    _lowerLimitTip.backgroundColor = kClearColor;
    _lowerLimitTip.font = [UIFont boldSystemFontOfSize:16];
    _lowerLimitTip.text = @"手续费上限";
    [self.view addSubview:_lowerLimitTip];
    
    _lowerEdit = [[UITextField alloc] init];
    _lowerEdit.backgroundColor = kWhiteColor;
    _lowerEdit.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_lowerEdit];
    
    _lowerBTCButton = [[UIButton alloc] init];
    [_lowerBTCButton setImage:[UIImage imageNamed:@"btc.png"] forState:UIControlStateNormal];
    [self.view addSubview:_lowerBTCButton];
    
    
    _defaultButton = [UIButton menuButton:@"默认值" target:self action:@selector(onDefault:)];
    [self.view addSubview:_defaultButton];
    
    _cancelButton = [UIButton menuButton:@"取消" target:self action:@selector(onCancel:)];
    [self.view addSubview:_cancelButton];
    
    _confirmButton = [UIButton menuButton:@"确认" target:self action:@selector(onConfirm:)];
    [self.view addSubview:_confirmButton];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBlank)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
}

- (void)onTapBlank
{
    [_upperEdit resignFirstResponder];
    [_lowerEdit resignFirstResponder];
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
    
    
    [_upperLimitTip sizeWith:CGSizeMake(size.width, 30)];
    [_upperLimitTip layoutBelow:_titleView margin:30];
    [_upperLimitTip alignParentLeftWithMargin:kHorMargin];
    
    [_upperBTCButton sizeWith:CGSizeMake(60, 30)];
    [_upperBTCButton layoutBelow:_upperLimitTip];
    [_upperBTCButton alignParentRightWithMargin:kHorMargin];
    
    [_upperEdit sameWith:_upperBTCButton];
    [_upperEdit layoutToLeftOf:_upperBTCButton margin:kHorMargin];
    [_upperEdit scaleToParentLeftWithMargin:kHorMargin];
    
    
    [_lowerLimitTip sameWith:_upperLimitTip];
    [_lowerLimitTip layoutBelow:_upperEdit margin:20];
    
    [_lowerEdit sameWith:_upperEdit];
    [_lowerEdit layoutBelow:_lowerLimitTip];
    
    [_lowerBTCButton sameWith:_upperBTCButton];
    [_lowerBTCButton layoutBelow:_lowerLimitTip];
    
    [_defaultButton sizeWith:CGSizeMake(120, kMenuSize.height)];
    [_defaultButton layoutParentHorizontalCenter];
    [_defaultButton layoutBelow:_lowerEdit margin:40];
    
    [_cancelButton sameWith:_defaultButton];
    [_cancelButton alignParentLeftWithMargin:kHorMargin];
    [_cancelButton layoutBelow:_defaultButton margin:20];
    
    [_confirmButton sameWith:_cancelButton];
    [_confirmButton alignParentRightWithMargin:kHorMargin];
    

    
}

@end
