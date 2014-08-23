//
//  UIImage+Common.h
//  CommonLibrary
//
//  Created by 陈耀武 on 13-11-6.
//  Copyright (c) 2013年 ywchen. All rights reserved.
//

#import <UIKit/UIKit.h>

// 默认取png图片
// 后期定认图片，使用一个专门的头文件
// 对每个使用的图片名称都定认宏，但不带后缀名

#define PNGName(name)       [NSString stringWithFormat:@"%@%@", name, @".png"]
#define PNGNameFroPad(name) [NSString stringWithFormat:@"%@%@", name, @"-iPad.png"]
#define JPGName(name)       [NSString stringWithFormat:@"%@%@", name, @".jpg"]
#define JPGNameFroPad(name) [NSString stringWithFormat:@"%@%@", name, @"-iPad.jpg"]

//#define PNGNamed(name)      [UIImage imageNamed:@""#name".png"]
//#define PADPngNamed(name)   [UIImage imageNamed:@""#name"-iPad.png"]
//#define JPGNamed(name)      [UIImage imageNamed:@""#name".jpg"]
//#define PADJPGNamed(name)   [UIImage imageNamed:@""#name"-iPad.jpg"]


////static __inline__ UIImage *UIImageNamed(NSString *name)
//UIImage *UIImageNamed(NSString *name);
////
////
////static __inline__ UIImage *UIJPGImageNamed(NSString *name)
//UIImage *UIJPGImageNamed(NSString *name);


static __inline__ UIImage *UIImageNamed(NSString *name)
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        NSString *imgname = PNGNameFroPad(name);
        UIImage *img = [UIImage imageNamed:imgname];
        
        if (img) {
            return img;
        }
        UIImage *phimg = [UIImage imageNamed:PNGName(name)];
        return phimg;
    }
    else
    {
        return [UIImage imageNamed:PNGName(name)];
    }
}

static __inline__ UIImage *UIJPGImageNamed(NSString *name)
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIImage *img = [UIImage imageNamed:JPGNameFroPad(name)];
        return img ? img : [UIImage imageNamed:JPGName(name)];
    }
    else
    {
        return [UIImage imageNamed:JPGName(name)];
    }
}

@interface UIImage (Common)

- (UIImage *)rescaleImageToSize:(CGSize)size;

- (UIImage *)cropImageToRect:(CGRect)cropRect;

- (CGSize)calculateNewSizeForCroppingBox:(CGSize)croppingBox;

- (UIImage *)cropCenterAndScaleImageToSize:(CGSize)cropSize;

- (UIImage *)cropToSquareImage;

// path为图片的键值
- (void)saveToCacheWithKey:(NSString *)key;

+ (UIImage *)loadFromCacheWithKey:(NSString *)key;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


// 该方法以有问题
//+ (UIImage *)imageNamedForIPAD:(NSString *)name;



@end
