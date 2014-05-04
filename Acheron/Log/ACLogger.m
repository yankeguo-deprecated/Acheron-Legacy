//
//  ACLogger.m
//  Pods
//
//  Created by YANKE Guo on 14-4-29.
//
//

#import "ACLogger.h"

void ACELog(NSString * format,...)
{
  va_list args;
  if (format) {
    va_start(args, format);
    [[ACLogger sharedLogger] errorlog:[[NSString alloc] initWithFormat:format arguments:args]];
    va_end(args);
  }
}

void ACDLog(NSString * format,...)
{
  va_list args;
  if (format) {
    va_start(args, format);
    [[ACLogger sharedLogger] debugLog:[[NSString alloc] initWithFormat:format arguments:args]];
    va_end(args);
  }
}

@interface ACLogger ()

@property (nonatomic,strong) NSFileHandle * stdError;
@property (nonatomic,strong) NSFileHandle * stdOutput;
@property (nonatomic,strong) dispatch_queue_t logQueue;

@end

@implementation ACLogger

+ (instancetype)sharedLogger
{
  static ACLogger * _static = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _static = [ACLogger new];
  });
  return _static;
}

- (id)init
{
  if (self = [super init]) {
    self.logQueue = dispatch_queue_create("ACLogger", NULL);
    self.stdError = [NSFileHandle fileHandleWithStandardError];
    self.stdOutput = [NSFileHandle fileHandleWithStandardOutput];
  }
  return self;
}

- (void)errorlog:(NSString*)content
{
  dispatch_async(self.logQueue, ^{
    [self.stdError writeData:[[content stringByAppendingString:@"\n"] dataUsingEncoding:NSUTF8StringEncoding]];
  });
}

- (void)debugLog:(NSString*)content
{
  dispatch_async(self.logQueue, ^{
    [self.stdOutput writeData:[[content stringByAppendingString:@"\n"] dataUsingEncoding:NSUTF8StringEncoding]];
  });
}

@end
