//
//  UIColor+YREasy.h
//  YRFrameworkExample
//
//  Created by YANKE Guo on 11/27/13.
//  Copyright (c) 2013 IREUL Guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Acheron)

@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
@property (nonatomic, readonly) BOOL canProvideRGBComponents;

// Only valid if canProvideRGBComponents is YES
@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;

// Only valid if colorSpaceModel == kCGColorSpaceModelMonochrome
@property (nonatomic, readonly) CGFloat white;

@property (nonatomic, readonly) CGFloat alpha;
@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat brightness;
@property (nonatomic, readonly) UInt32 rgbHex;

- (NSString *)colorSpaceString;
- (NSArray *)arrayFromRGBAComponents;

- (BOOL)red:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b alpha:(CGFloat *)a;
- (BOOL)hue:(CGFloat *)h saturation:(CGFloat *)s brightness:(CGFloat *)b
      alpha:(CGFloat *)a;

- (UIColor *)colorByLuminanceMapping;
- (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green
                                blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)colorByAddingRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
                        alpha:(CGFloat)alpha;
- (UIColor *)colorByLighteningToRed:(CGFloat)red green:(CGFloat)green
                               blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)colorByDarkeningToRed:(CGFloat)red green:(CGFloat)green
                              blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor *)colorByAddingHue:(CGFloat)hue saturation:(CGFloat)saturation
                   brightness:(CGFloat)brightness alpha:(CGFloat)alpha;

- (UIColor *)colorByMultiplyingBy:(CGFloat)f;
- (UIColor *)colorByAdding:(CGFloat)f;
- (UIColor *)colorByAdding:(CGFloat)f alpha:(CGFloat)alpha;
- (UIColor *)colorByLighteningTo:(CGFloat)f;
- (UIColor *)colorByDarkeningTo:(CGFloat)f;
- (UIColor *)colorByMultiplyingByColor:(UIColor *)color;
- (UIColor *)colorByAddingColor:(UIColor *)color;
- (UIColor *)colorByLighteningToColor:(UIColor *)color;
- (UIColor *)colorByDarkeningToColor:(UIColor *)color;

- (NSString *)stringFromColor;
- (NSString *)hexStringFromColor;

+ (UIColor *)randomColor;
+ (UIColor *)semiRandomColor;
+ (UIColor *)colorWithString:(NSString *)stringToConvert;
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithName:(NSString *)cssColorName;

@end
