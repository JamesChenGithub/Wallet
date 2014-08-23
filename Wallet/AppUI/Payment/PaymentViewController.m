//
//  PaymentViewController.m
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)addOwnViews
{
    [super addOwnViews];
    
    _targetAddressTip = [[UILabel alloc] init];
    _targetAddressTip.textColor = kWhiteColor;
    _targetAddressTip.backgroundColor = kClearColor;
    _targetAddressTip.font = [UIFont boldSystemFontOfSize:16];
    _targetAddressTip.text = @"付款目标地址";
    [self.view addSubview:_targetAddressTip];
    
    _targetAddressEdit = [[UITextField alloc] init];
    _targetAddressEdit.backgroundColor = kWhiteColor;
    _targetAddressEdit.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:_targetAddressEdit];
    
    _paymentTip = [[UILabel alloc] init];
    _paymentTip.textColor = kWhiteColor;
    _paymentTip.backgroundColor = kClearColor;
    _paymentTip.font = [UIFont boldSystemFontOfSize:16];
    _paymentTip.text = @"手续费上限";
    [self.view addSubview:_paymentTip];
    
    _paymentEdit = [[UITextField alloc] init];
    _paymentEdit.backgroundColor = kWhiteColor;
    _paymentEdit.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_paymentEdit];
    
    _paymentBTCButton = [[UIButton alloc] init];
    [_paymentBTCButton setImage:[UIImage imageNamed:@"btc.png"] forState:UIControlStateNormal];
    [self.view addSubview:_paymentBTCButton];
    
    
    _genereQRCode = [UIButton menuButton:@"生成二维码" target:self action:@selector(onGenereQRCode:)];
    [self.view addSubview:_genereQRCode];
    
    _qrCodeImageView = [[UIImageView alloc] init];
    _qrCodeImageView.layer.borderColor = kRedColor.CGColor;
    _qrCodeImageView.layer.borderWidth = 2;
    [self.view addSubview:_qrCodeImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBlank)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
}

- (void)onGenereQRCode:(UIButton *)btn
{
    
}

- (void)onTapBlank
{
    [_targetAddressEdit resignFirstResponder];
    [_paymentEdit resignFirstResponder];
}

#define kHorMargin 20

- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    CGRect rect = _backgroundView.frame;
    
    CGSize size = rect.size;
    size.width -= 2*kHorMargin;
    
    const NSInteger kVerMargin = [IOSDeviceConfig sharedConfig].isIPhone5 ? 10 : 5;
    
    
    [_targetAddressTip sizeWith:CGSizeMake(size.width, 30)];
    [_targetAddressTip layoutBelow:_titleView margin:kVerMargin];
    [_targetAddressTip alignParentLeftWithMargin:kHorMargin];
    
    [_targetAddressEdit sameWith:_targetAddressTip];
    [_targetAddressEdit layoutBelow:_targetAddressTip];
    
    [_paymentTip sameWith:_targetAddressTip];
    [_paymentTip layoutBelow:_targetAddressEdit margin:kVerMargin];
    
    
    [_paymentEdit sizeWith:CGSizeMake(200, 30)];
    [_paymentEdit layoutBelow:_paymentTip];
    [_paymentEdit alignParentLeftWithMargin:kHorMargin];

    
    [_paymentBTCButton sizeWith:CGSizeMake(60, 30)];
    [_paymentBTCButton alignTop:_paymentEdit];
    [_paymentBTCButton layoutToLeftOf:_paymentEdit];
    [_paymentBTCButton alignParentRightWithMargin:kHorMargin];
    
    [_genereQRCode sizeWith:kMenuSize];
    [_genereQRCode layoutParentHorizontalCenter];
    [_genereQRCode layoutBelow:_paymentEdit margin:kVerMargin];
    

    
    CGRect qrBtnRect = _genereQRCode.frame;
    
    CGRect qrImageRect = rect;
    qrImageRect.origin.y = qrBtnRect.origin.y + qrBtnRect.size.height + 5;
    qrImageRect.size.height = rect.origin.y + rect.size.height - qrImageRect.origin.y - 5;
    
    if (qrImageRect.size.height > qrImageRect.size.width)
    {
        qrImageRect = CGRectInset(qrImageRect, 0, (qrImageRect.size.height - qrImageRect.size.width)/2);
    }
    else
    {
        qrImageRect = CGRectInset(qrImageRect, (qrImageRect.size.width - qrImageRect.size.height)/2, 0);
    }
    _qrCodeImageView.frame = qrImageRect;
    
}

@end
