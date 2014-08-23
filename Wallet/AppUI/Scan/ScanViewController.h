//
//  ScanViewController.h
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "BaseViewController.h"

@interface ScanViewController : BaseViewController<ZXCaptureDelegate>
{
    UILabel *_scanTip;
    UIButton *_scanButton;
}


@end
