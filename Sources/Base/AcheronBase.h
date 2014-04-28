//
//  YGBase.h
//  Pods
//
//  Created by YANKE Guo on 14-4-29.
//
//

#ifndef YGDataKit_YGBase_h
#define YGDataKit_YGBase_h

#ifndef __IPHONE_4_0
# error "YGDataKit uses features only available in iOS SDK 4.0 and later."
#endif

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - Logs

#ifdef DEBUG
# define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
# define ELog(err) {if(err) DLog(@"%@", err)}
#else
# define DLog(...)
# define ELog(err)
#endif

#define ALog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);};

#pragma mark - Headers

#import "NSData+Acheron.h"
#import "NSDate+Acheron.h"
#import "NSDictionary+Acheron.h"
#import "NSString+Acheron.h"

#endif
