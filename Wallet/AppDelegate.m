//
//  AppDelegate.m
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)enterMainUI
{
    MainViewController *main = [NSObject loadClass:[MainViewController class]];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:main];
    self.window.rootViewController = nav;

}

@end
