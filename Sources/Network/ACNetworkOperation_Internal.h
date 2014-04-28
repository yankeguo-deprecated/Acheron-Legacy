//
//  ACNetworkOperation_Internal.h
//  Pods
//
//  Created by YANKE Guo on 14-4-29.
//
//

#import "ACNetworkOperation.h"

@interface ACNetworkOperation (/*Private*/)

-(BOOL) isCacheable;
-(void) setCachedData:(NSData*) cachedData;
-(void) setCacheHandler:(ACResponseBlock) cacheHandler;
-(void) updateHandlersFromOperation:(ACNetworkOperation*) operation;
-(void) updateOperationBasedOnPreviousHeaders:(NSMutableDictionary*) headers;
-(NSString*) uniqueIdentifier;

@end
