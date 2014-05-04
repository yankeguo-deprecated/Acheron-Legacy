//
//  Created by Felipe Cypriano on 05/10/13.
//  Copyright (c) 2013 Felipe Cypriano. All rights reserved.
//

#import "ACAssertHandler.h"

/// ---------------
/// @name ACAssert
/// ---------------

#define ACAssert(condition, desc, ...) \
    do { \
        if (!(condition)) { \
            [[ACAssertHandler handler] assertFailureWithExpression:[NSString stringWithUTF8String:#condition] \
                                               function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                                                   file:[NSString stringWithUTF8String:__FILE__] \
                                                   line:__LINE__ \
                                            description:(desc), ##__VA_ARGS__]; \
        } \
    } while(0)

#define ACAssertParameterNotNil(paramName) ACAssert((paramName), @"Invalid parameter '%s'. Must not be nil.", #paramName)

#define ACAssertIsInMainThread ACAssert(([NSThread isMainThread]), @"This should be running on the main thread.")
#define ACAssertIsNotInMainThread ACAssert((![NSThread isMainThread]), @"This should not be running on the main thread.")


/// -----------------------
/// @name ACAssertOrReturn
/// -----------------------

#define ACAssertOrReturn(condition, desc, ...) \
    do { if (!(condition)) { \
        [[ACAssertHandler handler] assertFailureOrReturnWithExpression:[NSString stringWithUTF8String:#condition] \
                                           function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                                               file:[NSString stringWithUTF8String:__FILE__] \
                                               line:__LINE__ \
                                        description:(desc), ##__VA_ARGS__]; \
        return; \
    } } while(0)

#define ACAssertOrReturnNil(condition, desc, ...) \
    do { if (!(condition)) { \
        [[ACAssertHandler handler] assertFailureOrReturnWithExpression:[NSString stringWithUTF8String:#condition] \
                                           function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                                               file:[NSString stringWithUTF8String:__FILE__] \
                                               line:__LINE__ \
                                        description:(desc), ##__VA_ARGS__]; \
        return nil; \
    } } while(0)

#define ACAssertOrReturnBlock(condition, desc, block) \
    do { if (!(condition)) { \
        [[ACAssertHandler handler] assertFailureOrReturnBlock:(block) \
                withExpression:[NSString stringWithUTF8String:#condition] \
                      function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                          file:[NSString stringWithUTF8String:__FILE__] \
                          line:__LINE__ \
                   description:(desc)]; \
        return; \
    } } while(0)

#define ACAssertOrReturnNilBlock(condition, desc, block) \
    do { if (!(condition)) { \
        [[ACAssertHandler handler] assertFailureOrReturnBlock:(block) \
                withExpression:[NSString stringWithUTF8String:#condition] \
                      function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                          file:[NSString stringWithUTF8String:__FILE__] \
                          line:__LINE__ \
                   description:(desc)]; \
        return nil; \
    } } while(0)
