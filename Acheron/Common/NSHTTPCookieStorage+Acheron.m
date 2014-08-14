//
//  NSHTTPCookieStorage+ACFramework.m
//  ACFrameworkExample
//
//  Created by YANKE Guo on 11/27/13.
//  Copyright (c) 2013 IREUL Guo. All rights reserved.
//

#import "NSHTTPCookieStorage+Acheron.h"

NSString * const ACKeyForSavedCookieStorage         =   @"ACKeyForSavedCookieStorage";

@implementation NSHTTPCookieStorage (Acheron)

- (void)saveToUserDefaults
{
    NSData * cookiesdata = [NSKeyedArchiver archivedDataWithRootObject:[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    [[NSUserDefaults standardUserDefaults] setObject:cookiesdata forKey:ACKeyForSavedCookieStorage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)resumeFromUserDefaults
{
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:ACKeyForSavedCookieStorage];
    if ([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        for (NSHTTPCookie * cookie in cookies) {
            [self setCookie:cookie];
        }
    }
}

+ (void)saveSharedStorageToUserDefaults
{
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] saveToUserDefaults];
}

+ (void)resumeSharedStorageFromUserDefaults
{
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] resumeFromUserDefaults];
}

@end
