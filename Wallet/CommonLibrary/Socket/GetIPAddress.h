//
//  GetIPAddress.h
//  RiverKtv
//
//  Created by 陈耀武 on 13-12-7.
//  Copyright (c) 2013年 ywchen. All rights reserved.
//

#define MAXADDRS    32  

extern char *ip_names[MAXADDRS];  

void InitAddresses();  
void GetIPAddresses();  
void GetHWAddresses();  