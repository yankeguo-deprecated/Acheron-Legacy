//
//  UIView+YREasyFrame.m
//  YRFrameworkExample
//
//  Created by YANKE Guo on 11/27/13.
//  Copyright (c) 2013 IREUL Guo. All rights reserved.
//

#import "UIView+Acheron.h"

@implementation UIView (Acheron)

#pragma mark - Easy frame

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGSize size = self.size;
    size.width = width;
    self.size = size;
}

- (void)setHeight:(CGFloat)height {
    CGSize size = self.size;
    size.height = height;
    self.size = size;
}

- (void)setX:(CGFloat)x {
    CGPoint origin = self.origin;
    origin.x = x;
    self.origin = origin;
}

- (void)setY:(CGFloat)y {
    CGPoint origin = self.origin;
    origin.y = y;
    self.origin = origin;
}

- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)width {
    return self.size.width;
}

- (CGFloat)height {
    return self.size.height;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGFloat)x {
    return self.origin.x;
}

- (CGFloat)y {
    return self.origin.y;
}

- (CGPoint)topRight {
    return CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMinY(self.frame));
}

- (CGPoint)bottomRight {
    return CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame));
}

- (CGPoint)bottomLeft {
    return CGPointMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame));
}

- (void)setBottomRight:(CGPoint)aBottomRight
{
    [self setOrigin:CGPointMake(aBottomRight.x - self.width, aBottomRight.y - self.height)];
}

- (void)setTopRight:(CGPoint)topRight
{
    [self setOrigin:CGPointMake(topRight.x - self.width, topRight.y)];
}

- (void)setBottomLeft:(CGPoint)aBottomLeft
{
    [self setOrigin:CGPointMake(aBottomLeft.x, aBottomLeft.y - self.height)];
}

- (CGPoint)topMiddle
{
    return CGPointMake(self.origin.x + self.width/2, self.origin.y);
}

- (void)setTopMiddle:(CGPoint)topMiddle
{
    self.origin = CGPointMake(topMiddle.x - self.width / 2, topMiddle.y);
}


- (void)setTopMiddle:(CGPoint)topMiddle withYOffset:(CGFloat)offset
{
    [self setTopMiddle:CGPointMake(topMiddle.x, topMiddle.y + offset)];
}

- (void)makeVecticalAlignTo:(CGRect)target
{
    self.y = target.origin.y - (self.height - target.size.height)/2;
}

- (void)makeHorizontalAlignTo:(CGRect)target
{
    self.x = target.origin.x - (self.width - target.size.width)/2;
}

- (CGPoint)bottomMiddle
{
    return CGPointMake(self.origin.x + self.width / 2, self.origin.y + self.height);
}

- (void)setBottomMiddle:(CGPoint)bottomMiddle
{
    self.origin = CGPointMake(bottomMiddle.x - self.width / 2, bottomMiddle.y - self.height);
}

- (void)setBottomMiddle:(CGPoint)topMiddle withYOffset:(CGFloat)offset
{
    [self setBottomMiddle:CGPointMake(topMiddle.x, topMiddle.y + offset)];
}

- (void)setRightMiddle:(CGPoint)rightMiddle withXOffset:(CGFloat)offset
{
    [self setRightMiddle:CGPointMake(rightMiddle.x + offset, rightMiddle.y)];
}

- (CGPoint)leftMiddle
{
    return CGPointMake(self.origin.x, self.origin.y + self.height / 2);
}

- (void)setLeftMiddle:(CGPoint)leftMiddle
{
    self.origin = CGPointMake(leftMiddle.x, leftMiddle.y - self.height / 2);
}

- (CGPoint)rightMiddle
{
    return CGPointMake(self.origin.x + self.width, self.origin.y + self.height / 2);
}

- (void)setRightMiddle:(CGPoint)rightMiddle
{
    self.origin = CGPointMake(rightMiddle.x - self.width, rightMiddle.y - self.height/2);
}

- (CGPoint)boundsCenter
{
    return CGPointMake(self.width/2, self.height/2);
}

- (void)resizeWidthTo:(CGFloat)width
{
    float factor = width / self.width;
    CGFloat height = self.height * factor;
    CGPoint oldCenter = self.center;
    self.size = CGSizeMake(width, height);
    self.center = oldCenter;
}

- (void)resizeHeightTo:(CGFloat)height
{
    float factor = height/self.height;
    CGFloat width = self.width * factor;
    CGPoint oldCenter = self.center;
    self.size = CGSizeMake(width, height);
    self.center = oldCenter;
}

@end
