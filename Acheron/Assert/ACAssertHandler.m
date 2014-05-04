//
//  Created by Felipe Cypriano on 10/05/13.
//  Copyright (c) 2013 Felipe Cypriano. All rights reserved.
//


#import <Acheron/AcheronLog.h>

#import "ACAssertHandler.h"

#ifndef ACAssertLog
#define ACAssertLog ACELog
#endif

#ifdef NS_BLOCK_ASSERTIONS
#define __ACAssertShouldAbort NO
#else
#define __ACAssertShouldAbort YES
#endif


NSString *const ACAssertErrorDomain = @"ACAssert";
NSString *const ACAssertExceptionName = @"ACAssertException";

@interface ACAssertHandler ()
@property (nonatomic) BOOL shouldRaiseWhenConditionFail;
@end

@implementation ACAssertHandler {

}

+ (ACAssertHandler *)handler {
    static ACAssertHandler *sharedHandler;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedHandler = [[ACAssertHandler alloc] init];
    });
    return sharedHandler;
}

- (id)init {
    self = [super init];
    if (self) {
        self.shouldRaiseWhenConditionFail = __ACAssertShouldAbort;
    }
    return self;
}

- (void)assertFailureWithExpression:(NSString *)expression function:(NSString *)function file:(NSString *)file line:(NSInteger)line description:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    [self _assertFailureShouldAbort:YES withExpression:expression function:function file:file line:line description:format arguments:args];
    va_end(args);
}

- (void)assertFailureOrReturnWithExpression:(NSString *)expression function:(NSString *)function file:(NSString *)file line:(NSInteger)line description:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    [self _assertFailureShouldAbort:self.shouldRaiseWhenConditionFail withExpression:expression function:function file:file line:line description:format arguments:args];
    va_end(args);
}

- (void)assertFailureOrReturnBlock:(ACAssertReturnBlock)returnBlock withExpression:(NSString *)expression function:(NSString *)function file:(NSString *)file line:(NSInteger)line description:(NSString *)description {
    [self _assertFailureShouldAbort:self.shouldRaiseWhenConditionFail withExpression:expression function:function file:file line:line description:description arguments:NULL];

    NSError *error = [NSError errorWithDomain:ACAssertErrorDomain
                                         code:0
                                     userInfo:@{ NSLocalizedDescriptionKey : description }];
    returnBlock(error);
}


#pragma mark - Private Methods

- (NSString *)_assertFailureShouldAbort:(BOOL)shouldAbort withExpression:(NSString *)expression function:(NSString *)function file:(NSString *)file line:(NSInteger)line description:(NSString *)format arguments:(va_list)args {
    NSString *description = @"";
    if (format) {
        description = [[NSString alloc] initWithFormat:format arguments:args];
    }
    ACAssertLog(@"%@: Assertion '%@' failed on line %@:%ld. %@", function, expression, file, (long) line, description);
    if (shouldAbort) {
        NSString *reason = [NSString stringWithFormat:@"Assertion '%@' failed. %@", expression, description];
        [[NSException exceptionWithName:ACAssertExceptionName reason:reason userInfo:nil] raise];
    }
    return [NSString stringWithFormat:@"%@: Assertion '%@' failed on line %@:%ld. %@", function, expression, file, (long) line, description];
}

@end