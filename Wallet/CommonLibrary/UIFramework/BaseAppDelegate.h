//
//  BaseAppDelegate.h
//  HKConnectCommon
//
//  Created by James on 3/6/14.
//  Copyright (c) 2014 HKConnect. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BaseAppDelegate : UIResponder<UIApplicationDelegate>
{
@protected
    UIBackgroundTaskIdentifier _backgroundTaskIdentifier;
}

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedAppDelegate;

- (BOOL)needInstallUncaughtExceptionHandler;

- (BOOL)needRedirectConsole;

// 加载应用程序配置
- (void)loadAppPrefrence:(UIApplication *)application;

// 配置App Adapter
- (void)configureApp;

// 进入主界面逻辑
- (void)enterMainUI;

// 启动一些后台服务
//- (void)startBackgroundService:(UIApplication *)application;



- (UINavigationController *)navigationViewController;

- (UIViewController *)topViewController;

- (void)pushViewController:(UIViewController *)viewController;
- (UIViewController *)popViewController;
- (NSArray *)popToRootViewController;

@end
