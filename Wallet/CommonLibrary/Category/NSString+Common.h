//
//  NSString+Common.h
//
//  Created by 陈耀武 on 12-11-5.
//  Copyright (c) 2012年 pizus. All rights reserved.
//

#import <Foundation/Foundation.h>

char pinyinFirstLetter(unsigned short hanzi);

@interface NSString (Common)

// 将str加密成本地保存的文件名
+ (NSString *)md5String:(NSString *)str;
- (NSString *)md5;

-(NSString*)firstPinYin;

//是否为空
+ (BOOL)isEmpty:(NSString *)string;

/**
 compare two version
 @param sourVersion *.*.*.*
 @param desVersion *.*.*.*
 @returns No,sourVersion is less than desVersion; YES, the statue is opposed
 */
+(BOOL)compareVerison:(NSString *)sourVersion withDes:(NSString *)desVersion;

//当前字符串是否只包含空白字符和换行符
- (BOOL)isWhitespaceAndNewlines;

//去除字符串前后的空白,不包含换行符
- (NSString *)trim;

//去除字符串中所有空白
- (NSString *)removeWhiteSpace;

//将字符串以URL格式编码
- (NSString *)stringByUrlEncoding;

/*!
 @brief     大写第一个字符
 @return    格式化后的字符串
 */
- (NSString *)capitalize;

//以给定字符串开始,忽略大小写
- (BOOL)startsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串开始
- (BOOL)startsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;


//以给定字符串结束，忽略大小写
- (BOOL)endsWith:(NSString *)str;
//以指定条件判断字符串是否以给定字符串结尾
- (BOOL)endsWith:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//包含给定的字符串, 忽略大小写
- (BOOL)containsString:(NSString *)str;
//以指定条件判断是否包含给定的字符串
- (BOOL)containsString:(NSString *)str Options:(NSStringCompareOptions)compareOptions;

//判断字符串是否相同，忽略大小写
- (BOOL)equalsString:(NSString *)str;


#pragma mark Hashing
- (NSString *)base64Encoding;

// 十六进制转换为普通字符串的。
+ (NSString *)stringFromHexString:(NSString *)hexString;

//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(NSString *)string;

@end
