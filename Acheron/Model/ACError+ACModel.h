//
//  ACError+ACModel.h
//  Pods
//
//  Created by YANKE Guo on 14-5-14.
//
//

#import "ACError.h"

/////////////////////////////////////////////////////////////////////////////////////////////

/** The domain name used for the JSONModelError instances */
extern NSString* const ACModelErrorDomain;

/** The code used for the ACModel errors */
typedef NS_ENUM(int, kACModelErrorTypes)
{
  kACModelErrorInvalidData    = 1,
  kACModelErrorBadResponse    = 2,
  kACModelErrorBadJSON        = 3,
  kACModelErrorModelIsInvalid = 4,
  kACModelErrorNilInput       = 5
};

/**
 * If the model JSON input misses keys that are required, check the
 * userInfo dictionary of the JSONModelError instance you get back -
 * under the kACModelMissingKeys key you will find a list of the
 * names of the missing keys.
 */
extern NSString* const kACModelMissingKeys;

/**
 * If JSON input has a different type than expected by the model, check the
 * userInfo dictionary of the JSONModelError instance you get back -
 * under the kACModelTypeMismatch key you will find a description
 * of the mismatched types.
 */
extern NSString* const kACModelTypeMismatch;

/**
 * If an error occurs in a nested model, check the userInfo dictionary of
 * the JSONModelError instance you get back - under the kACModelKeyPath
 * key you will find key-path at which the error occurred.
 */
extern NSString* const kACModelKeyPath;

@interface ACError (ACModel)

/*
 *  Tells if this ACError is a Model layer Error
 */

- (BOOL)isModelError;

/**
 * Creates a JSONModelError instance with code kACModelErrorInvalidData = 1
 */
+(id)errorInvalidDataWithMessage:(NSString*)message;

/**
 * Creates a JSONModelError instance with code kACModelErrorInvalidData = 1
 * @param keys a set of field names that were required, but not found in the input
 */
+(id)errorInvalidDataWithMissingKeys:(NSSet*)keys;

/**
 * Creates a JSONModelError instance with code kACModelErrorInvalidData = 1
 * @param A description of the type mismatch that was encountered.
 */
+(id)errorInvalidDataWithTypeMismatch:(NSString*)mismatchDescription;

/**
 * Creates a JSONModelError instance with code kACModelErrorBadResponse = 2
 */
+(id)errorBadResponse;

/**
 * Creates a JSONModelError instance with code kACModelErrorBadJSON = 3
 */
+(id)errorBadJSON;

/**
 * Creates a JSONModelError instance with code kACModelErrorModelIsInvalid = 4
 */
+(id)errorModelIsInvalid;

/**
 * Creates a JSONModelError instance with code kACModelErrorNilInput = 5
 */
+(id)errorInputIsNil;

/**
 * Creates a new JSONModelError with the same values plus information about the key-path of the error.
 * Properties in the new error object are the same as those from the receiver,
 * except that a new key kACModelKeyPath is added to the userInfo dictionary.
 * This key contains the component string parameter. If the key is already present
 * then the new error object has the component string prepended to the existing value.
 */
- (instancetype)errorByPrependingKeyPathComponent:(NSString*)component;

@end
