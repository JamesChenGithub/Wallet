//
//  SettingConnectTimeViewController.h
//  Wallet
//
//  Created by James on 14-7-18.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingConnectTimeViewController : BaseViewController
{
    UILabel *_connectTimeTip;
    UILabel *_connectTime;
    UIButton *_connectTimeDefaultButton;
    UISlider *_connectTimeSlider;
    
    
    UILabel *_connectCountTip;
    UILabel *_connectCount;
    UIButton *_connectCountDefaultButton;
    UISlider *_connectCountSlider;
    
    UIButton *_cancelButton;
    UIButton *_confirmButton;
}

@end
