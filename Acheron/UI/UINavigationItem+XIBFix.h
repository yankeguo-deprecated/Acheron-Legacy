//
//  UINavigationItem+XIBFix.h
//  Pods
//
//  Created by YANKE Guo on 14-5-8.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (XIBFix)

@property (nonatomic, strong) IBOutletCollection(UIBarButtonItem) NSArray* rightBarButtonItemsCollection;
@property (nonatomic, strong) IBOutletCollection(UIBarButtonItem) NSArray* leftBarButtonItemsCollection;

@end
