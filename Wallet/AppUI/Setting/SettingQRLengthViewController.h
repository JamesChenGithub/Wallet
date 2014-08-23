//
//  SettingQRLengthViewController.h
//  Wallet
//
//  Created by James on 14-7-18.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingQRLengthViewController : BaseViewController
{
    UILabel *_qrLengthTip;
    UILabel *_qrLength;
    UISlider *_qrSlider;
    
    UIButton *_defaultButton;
    UIButton *_cancelButton;
    UIButton *_confirmButton;
}

@end
