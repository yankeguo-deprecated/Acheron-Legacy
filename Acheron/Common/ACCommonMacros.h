//
//  ACCommonMacros.h
//  Pods
//
//  Created by YANKE Guo on 14-5-14.
//
//

#import "GBDeviceInfo.h"

#pragma mark - Determine Devices

#define AC_IOS_VERSION      ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define AC_IOS_7            (AC_IOS_VERSION < 8.0 && AC_IOS_VERSION >= 7.0)
#define AC_IOS_70           (AC_IOS_VERSION < 7.1 && AC_IOS_VERSION >= 7.0)
#define AC_IOS_6            (AC_IOS_VERSION < 7.0 && AC_IOS_VERSION >= 6.0)
#define AC_IOS_5            (AC_IOS_VERSION < 6.0 && AC_IOS_VERSION >= 5.0)

#define AC_SCREEN_4         (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON)
#define AC_SCREEN_3_5       (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)480) < DBL_EPSILON)

#define AC_DEVICE_IPHONE    ([[[UIDevice currentDevice] model] rangeOfString:@"iPhone"].location != NSNotFound)
#define AC_DEVICE_IPAD      ([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound)
#define AC_DEVICE_IPOD      ([[[UIDevice currentDevice] model] rangeOfString:@"iPod"].location != NSNotFound)
#define AC_DEVICE_SIMULATOR ([[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location != NSNotFound)

#pragma mark - Safetify Variables

#define SAFETIFY_STRING(VAR)   {if((VAR)==nil){VAR=@"";}}
