//
//  PaymentViewController.h
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface PaymentViewController : BaseViewController
{
    UILabel *_targetAddressTip;
    UITextField *_targetAddressEdit;
    
    UILabel *_paymentTip;
    UITextField *_paymentEdit;
    UIButton  *_paymentBTCButton;
    
    
    UIButton *_genereQRCode;
    
    UIImageView *_qrCodeImageView;
}

@end
