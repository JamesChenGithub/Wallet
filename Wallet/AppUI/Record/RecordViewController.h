//
//  RecordViewController.h
//  Wallet
//
//  Created by James on 14-7-9.
//  Copyright (c) 2014年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface RecordViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
}

@end
