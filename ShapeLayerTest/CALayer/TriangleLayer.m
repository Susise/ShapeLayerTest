//
//  TriangleLayer.m
//  ShapeLayerTest
//
//  Created by sunqiaoqiao on 2018/4/13.
//  Copyright © 2018年 S. All rights reserved.
//

#import "TriangleLayer.h"
#import <UIKit/UIKit.h>

@implementation TriangleLayer

- (void)drawInContext:(CGContextRef)ctx{//绘制一个三角形
    
   CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);;//填充，实心

    CGContextMoveToPoint(ctx, 50, 0);

    CGContextAddLineToPoint(ctx, 0, 100);

    CGContextAddLineToPoint(ctx, 100, 100);

    CGContextDrawPath(ctx, kCGPathFill);
    
    CGContextClosePath(ctx);
}
@end
