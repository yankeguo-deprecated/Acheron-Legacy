//
//  JSONModel+CoreData.h
//  JSONModelDemo_iOS
//
//  Created by Marin Todorov on 22/1/14.
//  Copyright (c) 2014 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACModel.h"
#import <CoreData/CoreData.h>

@interface ACModel(CoreData)

@end

@interface NSManagedObject(ACModel)

+(instancetype)entityWithModel:(id<AbstractACModelProtocol>)model inContext:(NSManagedObjectContext*)context error:(NSError**)error;
+(instancetype)entityWithDictionary:(NSDictionary*)dictionary inContext:(NSManagedObjectContext*)context error:(NSError**)error;
-(BOOL)updateWithDictionary:(NSDictionary*)dictionary error:(NSError**)error;

@end