//
//  RecordTableViewCell.h
//  Wallet
//
//  Created by James on 14-7-18.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordCellItemView : UIView
{
    UILabel *_key;
    UILabel *_value;
}

- (void)setKey:(NSString *)key value:(NSString *)value;

@end

@interface RecordTableViewCell : UITableViewCell
{
    RecordCellItemView *_dateItemView;
    RecordCellItemView *_accountItemView;
    RecordCellItemView *_operateItemView;
    RecordCellItemView *_succItemView;
    RecordCellItemView *_amountItemView;
}

@end
