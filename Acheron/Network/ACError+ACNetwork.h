//
//  ACError+ACNetwork.h
//  Pods
//
//  Created by YANKE Guo on 14-5-14.
//
//

#import "ACError.h"

extern NSString * const ACNetworkErrorDomain;
extern NSString * const ACHTTPErrorDomain;

typedef NS_ENUM(int, kACNetworkErrorTypes) {
  kACNetworkInternalError           = -1,
};

@interface ACError (ACNetwork)

- (BOOL)isNetworkError;

- (BOOL)isHTTPError;

+ (instancetype)errorWithNSURLConnectionError:(NSError*)error;

@end
