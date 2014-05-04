//
//  ACLogger.h
//  Pods
//
//  Created by YANKE Guo on 14-4-29.
//
//

#import <Foundation/Foundation.h>

extern void ACELog(NSString * format,...) NS_FORMAT_FUNCTION(1,2);
extern void ACDLog(NSString * format,...) NS_FORMAT_FUNCTION(1,2);

@interface ACLogger : NSObject

+ (instancetype)sharedLogger;

- (void)errorlog:(NSString*)content;
- (void)debugLog:(NSString*)content;

@end