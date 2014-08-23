//
//  UIButton+Common.m
//  TCLSales
//
//  Created by 陈耀武 on 14-1-17.
//  Copyright (c) 2014年 HKConnect. All rights reserved.
//

#import "UIButton+Common.h"

@implementation UIButton (Common)

+ (instancetype)buttonWithTip:(NSString *)tip
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [[FontHelper shareHelper] fontWithSize:14];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button setTitle:tip forState:UIControlStateNormal];
    return button;
}

//+ (instancetype)checkButton
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.showsTouchWhenHighlighted = YES;
//    [button setImage:UIImageNamed(kCheckUnselectedIcon) forState:UIControlStateNormal];
//    [button setImage:UIImageNamed(kCheckSelectedIcon) forState:UIControlStateSelected];
////    [button setImage:UIImageNamed(kCheckSelectedIcon) forState:UIControlStateHighlighted];
//    return button;
//}

+ (instancetype)menuButton:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:UIImageNamed(kMenuBgImg) forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
