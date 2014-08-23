//
//  ImageTitleButton.m
//  Wallet
//
//  Created by James on 3/21/14.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "ImageTitleButton.h"

@implementation ImageTitleButton

- (instancetype)init
{
    return [self initWithStyle:EImageLeftTitleRight];
}

- (instancetype)initWithStyle:(ImageTitleButtonStyle)style
{
    return [self initWithStyle:style maggin:UIEdgeInsetsMake(5, 5, 5, 5)];
}

- (instancetype)initWithStyle:(ImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin
{
    return [self initWithStyle:style maggin:margin padding:CGSizeMake(5, 5)];
}

- (instancetype)initWithStyle:(ImageTitleButtonStyle)style maggin:(UIEdgeInsets)margin padding:(CGSize)padding
{
    if (self = [super initWithFrame:CGRectZero])
    {
        _style = style;
        _margin = margin;
        _padding = padding;
        [self setTitleColor:kWhiteColor forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = kWhiteColor;
    }
    return self;
}


- (void)setMargin:(UIEdgeInsets)margin
{
    _margin = margin;
    [self setNeedsDisplay];
}

- (void)setPadding:(CGSize)padding
{
    _padding = padding;
    [self setNeedsDisplay];
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.bounds;
    
    rect.origin.x += _margin.left;
    rect.size.width -= _margin.left + _margin.right;
    rect.origin.y += _margin.top;
    rect.size.height -= _margin.top + _margin.bottom;
    
    UIImage *img = [self imageForState:UIControlStateNormal];
    CGFloat scale = [[UIScreen mainScreen] scale];

    CGSize size = CGSizeZero;
    
    if (CGSizeEqualToSize(self.imageSize, CGSizeZero))
    {
        size = CGSizeMake(img.size.width/scale, img.size.height/scale);
    }
    else
    {
        size = self.imageSize;
    }
    
    switch (_style)
    {
        case EImageTopTitleBottom:
        {
            CGRect imgRect = rect;
            imgRect.size.height = size.height;
            imgRect.origin.x += (imgRect.size.width - size.width)/2;
            imgRect.size.width = size.width;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.origin.y += imgRect.size.height + _padding.height;
            titleRect.size.height -= imgRect.size.height + _padding.height;
            self.titleLabel.frame = titleRect;
        }
            break;
        case ETitleTopImageBottom:
        {
            CGRect imgRect = rect;
            imgRect.origin.x += (imgRect.size.width - size.width)/2;
            imgRect.size.width = size.width;
            imgRect.size.height = size.height;
            imgRect.origin.y += rect.size.height - imgRect.size.height;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.size.height -= imgRect.size.height + _padding.height;
            self.titleLabel.frame = titleRect;
        }
            break;
        case EImageLeftTitleRight:
        {
            CGRect imgRect = rect;
            imgRect.size.width = size.width;
            imgRect.size.height = size.height;
            imgRect.origin.y += (rect.size.height - size.height)/2;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.origin.x += imgRect.size.width + _padding.width;
            titleRect.size.width -= imgRect.size.width + _padding.width;
            self.titleLabel.frame = titleRect;
        }
            break;
        case ETitleLeftImageright:
        {
            CGRect imgRect = rect;
            imgRect.size.width = size.width;
            imgRect.origin.x += rect.size.width - imgRect.size.width;
            imgRect.size.height = size.height;
            imgRect.origin.y += (rect.size.height - size.height)/2;
            self.imageView.frame = imgRect;
            
            CGRect titleRect = rect;
            titleRect.size.width -= imgRect.size.width + _padding.width;
            self.titleLabel.frame = titleRect;
        }
            break;
            
        default:
            break;
    }
}

- (void)layoutSubviews
{
    if (CGRectEqualToRect(self.bounds, CGRectZero))
    {
        return;
    }
    [super layoutSubviews];
    
//    // 单独设置title或image的时候只用
//    NSString *title = [self titleForState:UIControlStateNormal];
//    UIImage *image = [self imageForState:UIControlStateNormal];
//    if ([NSString isEmpty:title] && image)
//    {
        [self relayoutFrameOfSubViews];
//    }
}

- (void)setTintColor:(UIColor *)color
{
    if (color)
    {
        UIImage *img = [self imageForState:UIControlStateNormal];
        img = [img imageWithTintColor:color];
        [self setImage:img  forState:UIControlStateNormal];
        [self setTitleColor:color forState:UIControlStateNormal];
    }
}

@end
