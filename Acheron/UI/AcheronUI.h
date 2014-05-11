//
//  AcheronUI.h
//  Pods
//
//  Created by YANKE Guo on 14-5-8.
//
//

#import <Acheron/AcheronCommon.h>

#import "UINavigationItem+NIBFix.h"

#pragma mark - Quick Resource Loader

#define LoadNIB(NAME)   [UINib nibWithNibName:@#NAME bundle:nil]
#define LoadSB(NAME)    [UIStoryboard storyboardWithName:@#NAME bundle:nil]
#define LoadImage(NAME) [UIImage imageNamed:@#NAME]

#pragma mark - Quick Nib Binding

//  This macro define a `-(id)initWithFrame:(CGRect)frame` method binded with a Nib

#define ACMETHOD__initWithFrame__NIB_BINDED() \
                                              \
- (id)initWithFrame:(CGRect)frame {id obj = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:nil options:nil] firstObject];ACAssert([obj isKindOfClass:[self class]], @"Nib Class Mismatch: %@, expect %@",NSStringFromClass([obj class]),[self class]);return obj;}