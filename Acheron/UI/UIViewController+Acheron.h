//
//  UIViewController+Acheron.h
//  Pods
//
//  Created by Yanke Guo on 14-6-17.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (Acheron)

+ (instancetype)instanceWithIB;

//  For subclassing

+ (NSString*)bindedSBName;

+ (NSString*)bindedSBIdentifier;

+ (NSString*)bindedNibName;

@property (nonatomic,strong,readonly) UIScrollView * viewAsScrollView;

@end
