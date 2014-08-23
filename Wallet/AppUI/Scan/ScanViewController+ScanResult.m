//
//  ScanViewController+ScanResult.m
//  Wallet
//
//  Created by James on 14-7-10.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "ScanViewController+ScanResult.h"

@implementation ScanViewController (ScanResult)

// 扫描到二维码中的数据之后的处理方法
- (void)onScanResult:(NSString *)resultText
{
    // TODO: 添加相应的处理逻辑
    
    // TODO:分成若个个子串
    NSInteger count = 11;
//    arc4random()%10 + 1;
    NSMutableArray *stringArray = [NSMutableArray array];
    
    NSInteger len = resultText.length/count;
    for (NSInteger i = 0; i < count; i++)
    {
        if (i == count - 1)
        {
            NSString *sub = [resultText substringWithRange:NSMakeRange(i*len, resultText.length - i*len)];
            [stringArray addObject:sub];
        }
        else
        {
            NSString *sub = [resultText substringWithRange:NSMakeRange(i*len, len)];
            [stringArray addObject:sub];
        }
    }
    
    ScanResultsViewController *view = [NSObject loadClass:[ScanResultsViewController class]];
    view.scanResultArray = stringArray;
    [[AppDelegate sharedAppDelegate] pushViewController:view];
    
}

- (void)onScanResult:(NSString *)resultText withRawDataBytes:(NSData *)data
{
    NSInteger count = 4;
//    arc4random()%10 + 1;
    NSMutableArray *stringArray = [NSMutableArray array];
    
    NSInteger len = data.length/count;
    for (NSInteger i = 0; i < count; i++)
    {
        if (i == count - 1)
        {
            NSInteger lastLen = data.length - i * len;
            int bytes[len];
            [data getBytes:&bytes range:NSMakeRange(i * len, lastLen)];
            NSData *chip = [NSData dataWithBytes:bytes length:len];
            [stringArray addObject:chip];
        }
        else
        {
            int bytes[len];
            [data getBytes:&bytes range:NSMakeRange(i * len, len)];
            NSData *chip = [NSData dataWithBytes:bytes length:len];
            [stringArray addObject:chip];
        }
    }
    
    ScanResultsViewController *view = [NSObject loadClass:[ScanResultsViewController class]];
    view.scanResultArray = stringArray;
    [[AppDelegate sharedAppDelegate] pushViewController:view];
    

}



@end
