//
//  NSHTTPCookieStorage+YRFramework.h
//  YRFrameworkExample
//
//  Created by YANKE Guo on 11/27/13.
//  Copyright (c) 2013 IREUL Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const ACKeyForSavedCookieStorage;

@interface NSHTTPCookieStorage (Acheron)

+ (void)saveSharedStorageToUserDefaults;

+ (void)resumeSharedStorageFromUserDefaults;

- (void)saveToUserDefaults;

- (void)resumeFromUserDefaults;

@end
