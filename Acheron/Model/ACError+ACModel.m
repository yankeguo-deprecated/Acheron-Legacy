//
//  ACError+ACModel.m
//  Pods
//
//  Created by YANKE Guo on 14-5-14.
//
//

#import "ACError+ACModel.h"

NSString* const ACModelErrorDomain = @"me.yanke.Acheron.ACModelErrorDomain";

NSString* const kACModelMissingKeys = @"kACModelMissingKeys";
NSString* const kACModelTypeMismatch = @"kACModelTypeMismatch";
NSString* const kACModelKeyPath = @"kACModelKeyPath";

@implementation ACError (ACModel)

- (BOOL)isModelError
{
  return [self.domain isEqualToString:ACModelErrorDomain];
}

+(id)errorInvalidDataWithMessage:(NSString*)message
{
	message = [NSString stringWithFormat:@"Invalid JSON data: %@", message];
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorInvalidData
                              userInfo:@{NSLocalizedDescriptionKey:message}];
}

+(id)errorInvalidDataWithMissingKeys:(NSSet *)keys
{
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorInvalidData
                              userInfo:@{NSLocalizedDescriptionKey:@"Invalid JSON data. Required JSON keys are missing from the input. Check the error user information.",kACModelMissingKeys:[keys allObjects]}];
}

+(id)errorInvalidDataWithTypeMismatch:(NSString*)mismatchDescription
{
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorInvalidData
                              userInfo:@{NSLocalizedDescriptionKey:@"Invalid JSON data. The JSON type mismatches the expected type. Check the error user information.",kACModelTypeMismatch:mismatchDescription}];
}

+(id)errorBadResponse
{
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorBadResponse
                              userInfo:@{NSLocalizedDescriptionKey:@"Bad network response. Probably the JSON URL is unreachable."}];
}

+(id)errorBadJSON
{
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorBadJSON
                              userInfo:@{NSLocalizedDescriptionKey:@"Malformed JSON. Check the JSONModel data input."}];
}

+(id)errorModelIsInvalid
{
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorModelIsInvalid
                              userInfo:@{NSLocalizedDescriptionKey:@"Model does not validate. The custom validation for the input data failed."}];
}

+(id)errorInputIsNil
{
  return [ACError errorWithDomain:ACModelErrorDomain
                                  code:kACModelErrorNilInput
                              userInfo:@{NSLocalizedDescriptionKey:@"Initializing model with nil input object."}];
}

- (instancetype)errorByPrependingKeyPathComponent:(NSString*)component
{
  // Create a mutable  copy of the user info so that we can add to it and update it
  NSMutableDictionary* userInfo = [self.userInfo mutableCopy];
  
  // Create or update the key-path
  NSString* existingPath = userInfo[kACModelKeyPath];
  NSString* separator = [existingPath hasPrefix:@"["] ? @"" : @".";
  NSString* updatedPath = (existingPath == nil) ? component : [component stringByAppendingFormat:@"%@%@", separator, existingPath];
  userInfo[kACModelKeyPath] = updatedPath;
  
  // Create the new error
  return [ACError errorWithDomain:self.domain
                                  code:self.code
                              userInfo:[NSDictionary dictionaryWithDictionary:userInfo]];
}

@end
