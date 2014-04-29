//
//  Acheron.h
//  Pods
//
//  Created by YANKE Guo on 14-4-29.
//
//

#import "ACLogger.h"

#ifdef DEBUG
# define DLog(fmt, ...) {ACDLog((@"%s(Line:%d) " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#else
# define DLog(...)
#endif

#define ELog(fmt, ...)  {ACELog((@"%s(Line:%d) " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}