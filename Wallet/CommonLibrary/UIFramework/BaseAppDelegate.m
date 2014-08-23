//
//  BaseAppDelegate.m
//  HKConnectCommon
//
//  Created by James on 3/6/14.
//  Copyright (c) 2014 HKConnect. All rights reserved.
//

#import "BaseAppDelegate.h"
#import <objc/runtime.h>



//void UncaughtExceptionHandlerFunction(NSException *exception) {
//    
//    NSString *reason = [exception reason];
//    NSString *name = [exception name];
//    DebugLog(@"UncaughtExceptionHandler : reason = %@, name = %@",reason, name);
//    //调用停止DLNA
////    if ([MusicPlayerManager shareInstance].isDMCNow) {
////    [[MusicPlayerManager shareInstance] stop];
////    }
//}

@implementation BaseAppDelegate

+ (instancetype)sharedAppDelegate
{
    return [UIApplication sharedApplication].delegate;
}

// 是否需要添加异常捕获
- (BOOL)needInstallUncaughtExceptionHandler
{
    return NO;
}

- (BOOL)needRedirectConsole
{
    return NO;
}

- (void)redirectConsoleLog:(NSString *)logFile
{
    NSString *docPath = [PathUtility getDocumentPath];
    NSString *logfilePath = [NSString stringWithFormat:@"%@/%@", docPath, logFile];
//    freopen([logfilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    freopen([logfilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
}


//- (void)installUncaughtExceptionHandler
//{
//    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandlerFunction);
//    InstallUncaughtExceptionHandler();
//
//}


// 加载应用程序配置
- (void)loadAppPrefrence:(UIApplication *)application
{
    // 取图片逻辑
    // 代码中全部使用UIImageNamed(NSString *name)进行取图片
//    if ([IOSDeviceConfig sharedConfig].isIPad)
//    {
//        Class imgCls = [UIImage class];
//        Method originalMethod = class_getClassMethod(imgCls,  @selector(imageNamed:));
//        Method newMethod = class_getClassMethod(imgCls, @selector(imageNamedForIPAD:));
//        method_exchangeImplementations(originalMethod, newMethod);
//    }
    
    // 添加异常捕获逻辑
//    if ([self needInstallUncaughtExceptionHandler])
//    {
//        [self installUncaughtExceptionHandler];
//    }
    
    // 日重重定向处理
    if ([self needRedirectConsole])
    {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];

        [self redirectConsoleLog:[NSString stringWithFormat:@"%@.log", currentDateStr]];
    }
    
    [application beginReceivingRemoteControlEvents];
    
    
//    if ([IOSDeviceConfig sharedConfig].isIOS6) {
//        [application setStatusBarHidden:YES];
//    }
    
}

// 配置App Adapter
- (void)configureApp
{
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

// 进入主界面逻辑
- (void)enterMainUI
{
    
}

//// 启动一些后台服务
//- (void)startBackgroundService:(UIApplication *)application
//{
//    [application beginReceivingRemoteControlEvents];
//    [[MPMusicPlayerController iPodMusicPlayer] beginGeneratingPlaybackNotifications];
//    AVAudioSession *session = [AVAudioSession sharedInstance];
//    [session setActive:YES error:nil];
//    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadAppPrefrence:application];
    [self configureApp];
    [[NetworkUtility sharedNetworkUtility] startCheckWifi];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self enterMainUI];
    
    [self.window makeKeyAndVisible];
    
//    [self startBackgroundService:application];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    _backgroundTaskIdentifier = [application beginBackgroundTaskWithExpirationHandler: ^{
        [application endBackgroundTask:_backgroundTaskIdentifier];
    }];
    
    [self becomeFirstResponder];
}

- (void)applicationWillonEnterForeground:(UIApplication *)application
{
    if ([IOSDeviceConfig sharedConfig].isIPad)
    {
        UIDevice *curDevice = [UIDevice currentDevice];
        if (!curDevice.isGeneratingDeviceOrientationNotifications)
        {
            [curDevice beginGeneratingDeviceOrientationNotifications];
        }
    }
    _backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    [self resignFirstResponder];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [application endReceivingRemoteControlEvents];
    [SingletonMgr uninstall];
//    SignalTerminateMsg();
    
    UIDevice *curDevice = [UIDevice currentDevice];
    if (!curDevice.isGeneratingDeviceOrientationNotifications) {
        [curDevice endGeneratingDeviceOrientationNotifications];
    }
}

//- (void) remoteControlReceivedWithEvent: (UIEvent *)receivedEvent
//{
//    if (receivedEvent.type == UIEventTypeRemoteControl)
//    {
//        MusicPlayerManager *mgr = [MusicPlayerManager shareInstance];
//        switch (receivedEvent.subtype)
//        {
//            case UIEventSubtypeRemoteControlTogglePlayPause:
//            {
//                [mgr playOrPause];
//            }
//                break;
//            case UIEventSubtypeRemoteControlPause:
//            {
//                [mgr pause];
//            }
//                break;
//            case UIEventSubtypeRemoteControlPlay:
//            {
//                [mgr playOrPause];
//            }
//                break;
//            case UIEventSubtypeRemoteControlNextTrack:
//            {
//                [mgr playNext];
//            }
//                break;
//            case UIEventSubtypeRemoteControlPreviousTrack:
//            {
//                [mgr playPrevious];
//            }
//                break;
//            default:
//                break;
//        }
//    }
//}

- (UINavigationController *)navigationViewController
{
    if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)self.window.rootViewController;
    }
    return nil;
}

- (UIViewController *)topViewController
{
    UINavigationController *nav = [self navigationViewController];
    return nav.topViewController;
}

- (void)pushViewController:(UIViewController *)viewController
{
    [[self navigationViewController] pushViewController:viewController animated:NO];
}
- (UIViewController *)popViewController
{
    return [[self navigationViewController] popViewControllerAnimated:NO];
}
- (NSArray *)popToRootViewController
{
    return [[self navigationViewController] popToRootViewControllerAnimated:NO];
}

@end
