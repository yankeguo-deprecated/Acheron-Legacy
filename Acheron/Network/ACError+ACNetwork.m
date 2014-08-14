//
//  ACError+ACNetwork.m
//  Pods
//
//  Created by YANKE Guo on 14-5-14.
//
//

#import "ACError+ACNetwork.h"

NSString * const ACNetworkErrorDomain    =   @"me.yanke.Acheron.NetworkErrorDomain";
NSString * const ACHTTPErrorDomain       =   @"me.yanke.Acheron.HTTPErrorDomain";

@implementation ACError (ACNetwork)

- (BOOL)isNetworkError
{
  return [ACNetworkErrorDomain isEqualToString:self.domain];
}

- (BOOL)isHTTPError
{
  return [ACHTTPErrorDomain isEqualToString:self.domain];
}

+ (instancetype)errorWithNSURLConnectionError:(NSError*)error
{
  return [[[self class] alloc] initWithDomain:ACNetworkErrorDomain code:error.code userInfo:error.userInfo];
}

@end
