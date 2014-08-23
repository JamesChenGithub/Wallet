//
//  UIButton+Common.h
//  TCLSales
//
//  Created by 陈耀武 on 14-1-17.
//  Copyright (c) 2014年 HKConnect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Common)

+ (instancetype)buttonWithTip:(NSString *)tip;

//+ (instancetype)checkButton;

+ (instancetype)menuButton:(NSString *)title target:(id)target action:(SEL)action;

@end
