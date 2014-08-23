//
//  SettingFeeViewController.h
//  Wallet
//
//  Created by James on 14-7-17.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingFeeViewController : BaseViewController
{
@private
    UILabel *_upperLimitTip;
    UITextField *_upperEdit;
    UIButton  *_upperBTCButton;
    
    UILabel *_lowerLimitTip;
    UITextField *_lowerEdit;
    UIButton  *_lowerBTCButton;
    
    
    UIButton *_defaultButton;
    UIButton *_cancelButton;
    UIButton *_confirmButton;
    
}


@end
