//
//  UIImage+YRFramework.h
//  QBEducation
//
//  Created by YANKE Guo on 12/5/13.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Acheron)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//loseless resize

- (UIImage *)imageResizedToScale:(CGFloat)scale;

- (UIImage *)imageScaledToWidth:(CGFloat)width height:(CGFloat)height;

- (UIImage *)imageScaledToQuarter;
- (UIImage *)imageScaledToHalf;
- (UIImage *)imageScaledToScale:(CGFloat)scale;
- (UIImage *)imageScaledToScale:(CGFloat)scale
       withInterpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)fixOrientation;

@end
