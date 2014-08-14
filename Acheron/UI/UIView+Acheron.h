//
//  UIView+YREasyFrame.h
//  YRFrameworkExample
//
//  Created by YANKE Guo on 11/27/13.
//  Copyright (c) 2013 IREUL Guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Acheron)

#pragma mark - Easy frame

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGPoint bottomRight;
@property (nonatomic, assign) CGPoint bottomLeft;
@property (nonatomic, assign) CGPoint topRight;

@property (nonatomic, assign) CGPoint topMiddle;

- (void)setTopMiddle:(CGPoint)topMiddle withYOffset:(CGFloat)offset;

@property (nonatomic, assign) CGPoint bottomMiddle;

- (void)setBottomMiddle:(CGPoint)topMiddle withYOffset:(CGFloat)offset;

@property (nonatomic, assign) CGPoint leftMiddle;
@property (nonatomic, assign) CGPoint rightMiddle;

- (void)setRightMiddle:(CGPoint)rightMiddle withXOffset:(CGFloat)offset;

@property (nonatomic, readonly) CGPoint boundsCenter;

- (void)resizeWidthTo:(CGFloat)width;
- (void)resizeHeightTo:(CGFloat)height;

- (void)makeVecticalAlignTo:(CGRect)target;
- (void)makeHorizontalAlignTo:(CGRect)target;

@end
