//
//  RecordTableViewCell.m
//  Wallet
//
//  Created by James on 14-7-18.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordCellItemView

- (void)addOwnViews
{
    _key = [[UILabel alloc] init];
    _key.backgroundColor = kClearColor;
    _key.textAlignment = NSTextAlignmentRight;
    _key.adjustsFontSizeToFitWidth = YES;
    _key.font = [UIFont systemFontOfSize:15];
    _key.textColor = kWhiteColor;
    [self addSubview:_key];
    
    _value = [[UILabel alloc] init];
    _value.backgroundColor = kClearColor;
    _value.textAlignment = NSTextAlignmentCenter;
    _value.adjustsFontSizeToFitWidth = YES;
    _value.font = [UIFont systemFontOfSize:15];
    _value.textColor = kWhiteColor;
    [self addSubview:_value];
    
    self.backgroundColor = RGB(57, 57, 57);
    self.layer.borderColor = kWhiteColor.CGColor;
    self.layer.borderWidth = 1;
}

- (void)relayoutFrameOfSubViews
{
    [_key sizeWith:CGSizeMake(60, self.bounds.size.height)];
    [_value sameWith:_key];
    [_value layoutToRightOf:_key];
    [_value scaleToParentRight];
}

- (void)setKey:(NSString *)key value:(NSString *)value
{
    _key.text = key;
    _value.text = value;
}

@end

@implementation RecordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        _dateItemView = [[RecordCellItemView alloc] init];
        [_dateItemView setKey:@"时间" value:@"2014-7-18 22:00"];
        [self.contentView addSubview:_dateItemView];
        
        _accountItemView = [[RecordCellItemView alloc] init];
        [_accountItemView setKey:@"帐户" value:@"James Chen"];
        [self.contentView addSubview:_accountItemView];
        
        _operateItemView = [[RecordCellItemView alloc] init];
        [_operateItemView setKey:@"操作" value:@"James Chen"];
        [self.contentView addSubview:_operateItemView];
        
        _succItemView = [[RecordCellItemView alloc] init];
        [_succItemView setKey:@"成败" value:@"成功"];
        [self.contentView addSubview:_succItemView];
        
        _amountItemView = [[RecordCellItemView alloc] init];
        [_amountItemView setKey:@"金额" value:@"1234"];
        [self.contentView addSubview:_amountItemView];
        
        self.contentView.backgroundColor = kClearColor;
    }
    
    return self;
}

- (void)relayoutFrameOfSubViews
{
    CGRect rect = self.contentView.bounds;
    
    rect = CGRectInset(rect, 10, 0);
    
    rect.origin.y += 5;
    rect.size.height /= 5;
    
    [_dateItemView setFrameAndLayout:rect];
    
    rect.origin.y += rect.size.height - 1;
    [_accountItemView setFrameAndLayout:rect];
    
    rect.origin.y += rect.size.height - 1;
    [_operateItemView setFrameAndLayout:rect];
    
    rect.origin.y += rect.size.height - 1;
    [_succItemView setFrameAndLayout:rect];
    
    rect.origin.y += rect.size.height - 1;
    [_amountItemView setFrameAndLayout:rect];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayoutFrameOfSubViews];
}

@end
