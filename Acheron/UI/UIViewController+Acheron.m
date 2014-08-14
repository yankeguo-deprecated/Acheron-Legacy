//
//  UIViewController+Acheron.m
//  Pods
//
//  Created by Yanke Guo on 14-6-17.
//
//

#import <Acheron/AcheronAssert.h>

#import "ACUIMacros.h"
#import "UIViewController+Acheron.h"

@implementation UIViewController (Acheron)

+ (instancetype)instanceWithIB
{
  if ([[self class] bindedSBName] == nil) {
    return [[self class] instanceWithNib];
  } else {
    return [[self class] instanceWithSB];
  }
}

+ (instancetype)instanceWithSB
{
  ACAssert([[self class] bindedSBName] != nil, @"Subclass must implement `bindedSBName` method");
  UIStoryboard * sb = [UIStoryboard storyboardWithName:[[self class] bindedSBName] bundle:nil];
  id target = nil;
  if ([[self class] bindedSBIdentifier] == nil) {
    target = [sb instantiateInitialViewController];
  } else {
    target = [sb instantiateViewControllerWithIdentifier:[[self class] bindedSBIdentifier]];
  }
  ACAssertParameterNotNil(target);
  if ([target isKindOfClass:[UIViewController class]] || [target isKindOfClass:[UINavigationController class]] || [target isKindOfClass:[UITableViewController class]]) {
    ACELog(@"========= Warning ==========\n   View controller %@ seems not binded in storyboard\n ======================",NSStringFromClass([self class]));
  }
  return target;
}

+ (instancetype)instanceWithNib
{
  return [[[self class] alloc] initWithNibName:[[self class] bindedNibName] bundle:nil];
}

- (UIScrollView*)viewAsScrollView
{
  ACAssert([self.view isKindOfClass:[UIScrollView class]], @"self.view is not a scrollview");
  return (UIScrollView*)self.view;
}

//  For subclassing

+ (NSString*)bindedSBName
{
  return nil;
}

+ (NSString*)bindedSBIdentifier
{
  return nil;
}

+ (NSString*)bindedNibName
{
  return nil;
}

@end
