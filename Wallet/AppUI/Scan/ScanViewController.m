//
//  ScanViewController.m
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "ScanViewController.h"

@interface ScanViewController ()

@property (nonatomic, retain) CALayer *imageLayer;

@property (nonatomic, strong) ZXCapture *capture;

@property (nonatomic, assign) BOOL isComplete;

@end


@implementation ScanViewController


- (void)onCancel
{
    if (self.capture.running)
    {
#if TARGET_OS_IPHONE
        [self.capture stop];
#endif
        
#if TARGET_IPHONE_SIMULATOR
        [self onScanResult:@"12345678900987654321123456789009876543211234"];
#else
        [_scanButton setTitle:@"扫描" forState:UIControlStateNormal];
#endif
    }
    else
    {
#if TARGET_OS_IPHONE
        [self.capture start];
#endif
        [_scanButton setTitle:@"取消" forState:UIControlStateNormal];
    }
}

- (void)addOwnViews
{
    [super addOwnViews];
    
    _scanTip = [[UILabel alloc] init];
    _scanTip.textColor = kWhiteColor;
    _scanTip.backgroundColor = kClearColor;
    _scanTip.font = [UIFont boldSystemFontOfSize:24];
    _scanTip.text = @"请扫描注册码";
    [self.view addSubview:_scanTip];
    
    _scanButton = [UIButton menuButton:@"取消" target:self action:@selector(onCancel)];
    [self.view addSubview:_scanButton];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //摄像头去扫
    self.capture = [[ZXCapture alloc] init];
    [self.capture setCamera:1];
    [self.capture setRotation:90];
    [self.capture setDelegate:self];
    [self.capture setLuminance:YES];
    [self.capture  setFocusMode:AVCaptureFocusModeAutoFocus];
    CALayer *layer = self.capture.luminance;//显示彩色照片
    layer.borderColor = [UIColor redColor].CGColor;
    layer.borderWidth = 2;
    
    [self.view.layer addSublayer:self.capture.luminance];
    
    self.capture.delegate = self; // 开始扫描
}

- (void)layoutOnIPhone
{
    [super layoutOnIPhone];
    CGRect bounds = _backgroundView.frame;;
    
    BOOL isIphone4 = [IOSDeviceConfig sharedConfig].isIPhone4;
    CGSize layerSize =  isIphone4 ? CGSizeMake(240, 240) : CGSizeMake(320, 320);
    self.capture.luminance.frame = CGRectMake((bounds.size.width - layerSize.width)/2, bounds.origin.y + (bounds.size.height - layerSize.width)/2 , layerSize.width, layerSize.height);
    
    CGSize size = kMenuSize;
    _scanButton.frame = CGRectMake((bounds.size.width - size.width)/2, self.capture.luminance.frame.origin.y + self.capture.luminance.frame.size.height + 10, size.width, size.height);
    
    CGFloat x = isIphone4 ? self.capture.luminance.frame.origin.x : 30;
    _scanTip.frame = CGRectMake(x, self.capture.luminance.frame.origin.y - 30, bounds.size.width - 2*x, 30);
}


# pragma mark ZXcapture 代理方法
- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result
{
    if (_isComplete)
    {
        return;
    }
    _isComplete = YES;
    [capture stop];
    
    
    NSData *rawMetaData = [result rawMetaData];
    
    if (result || rawMetaData)
    {
        if (rawMetaData)
        {
            NSString *rawMetaDataString = [rawMetaData hexString];
            [self onScanResult:rawMetaDataString withRawDataBytes:rawMetaData];
        }
        else
        {
            // 处理返回的结果
            NSString *contents = result.text;
            [self onScanResult:contents];
        }
    }
    else
    {
        NSLog(@"中文出错");
    }
}

- (void)captureSize:(ZXCapture *)capture width:(NSNumber *)width height:(NSNumber *)height
{
    DebugLog(@"captureSize");
}

- (void)captureCameraIsReady:(ZXCapture *)capture
{
    DebugLog(@"captureCameraIsReady");
}
@end

