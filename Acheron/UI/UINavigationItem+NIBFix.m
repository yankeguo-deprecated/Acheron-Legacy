//
//  UINavigationItem+XIBFix.m
//  Pods
//
//  Created by YANKE Guo on 14-5-8.
//
//

#import "UINavigationItem+NIBFix.h"

@implementation UINavigationItem (NIBFix)

- (void) setRightBarButtonItemsCollection:(NSArray *)rightBarButtonItemsCollection {
  self.rightBarButtonItems = [rightBarButtonItemsCollection sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES]]];
}

- (void) setLeftBarButtonItemsCollection:(NSArray *)leftBarButtonItemsCollection {
  self.leftBarButtonItems = [leftBarButtonItemsCollection sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES]]];
}

- (NSArray*) rightBarButtonItemsCollection {
  return self.rightBarButtonItems;
}

- (NSArray*) leftBarButtonItemsCollection {
  return self.leftBarButtonItems;
}

@end
