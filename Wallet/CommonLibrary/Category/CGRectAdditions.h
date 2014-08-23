
//
//  CGRectAdditions.h
//  HKConnectCommon
//
//  Created by 陈耀武 on 14-2-21.
//  Copyright (c) 2014年 HKConnect. All rights reserved.
//

#ifndef HKConnectCommon_CGRectAdditions_h
#define HKConnectCommon_CGRectAdditions_h

static __inline__ CGRect CGRectFromCGSize( CGSize size )
{
    return CGRectMake( 0, 0, size.width, size.height );
};

static __inline__ CGRect CGRectMakeWithCenterAndSize( CGPoint center, CGSize size )
{
    return CGRectMake( center.x - size.width/2, center.y - size.height/2, size.width, size.height);
};

static __inline__ CGRect CGRectMakeWithOriginAndSize( CGPoint origin, CGSize size )
{
    return CGRectMake( origin.x, origin.y, size.width, size.height );
};

static __inline__ CGPoint CGRectCenter( CGRect rect )
{
    return CGPointMake( CGRectGetMidX( rect ), CGRectGetMidY( rect ) );
};

#endif
