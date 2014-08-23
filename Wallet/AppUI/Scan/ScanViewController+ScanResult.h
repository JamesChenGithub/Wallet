//
//  ScanViewController+ScanResult.h
//  Wallet
//
//  Created by James on 14-7-10.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController (ScanResult)

// 扫描到二维码中的数据之后的处理方法
- (void)onScanResult:(NSString *)resultText;

- (void)onScanResult:(NSString *)resultText withRawDataBytes:(NSData *)data;

@end
