//
//  CALayerViewController.m
//  ShapeLayerTest
//
//  Created by sunqiaoqiao on 2018/4/13.
//  Copyright © 2018年 S. All rights reserved.
//

#import "CALayerViewController.h"
#import "TriangleLayer.h"

@interface CALayerViewController ()<CALayerDelegate>

@end

@implementation CALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CALayer";
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self changeviewappear];
    
    [self testCustomeLayer];
}

//因为view上能显示内容都是因为它上面的层 layer。所以可以通过修改层，来修改view的显示内容
- (void)changeviewappear{
    /*通过改变layer 改变view的显示*/
    
     UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10,[UIApplication sharedApplication].statusBarFrame.size.height + 44 + 10, 50, 50)];
     view.backgroundColor = [UIColor cyanColor];
     view.layer.cornerRadius = 10;
     view.layer.masksToBounds = YES;
     view.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1); //transform
     [self.view addSubview:view];


    /*添加layer*/

    CALayer *mylayer = [CALayer layer];
    mylayer .bounds = CGRectMake(0, 0, 100, 100);
    mylayer.position = self.view.center;
    mylayer.contents = (id)[UIImage imageNamed:@"result_success"].CGImage;
    mylayer.cornerRadius = 10;
    mylayer.masksToBounds = YES;
    [self.view.layer addSublayer:mylayer];
    
   //CALayer中使用CGColorRef和CGImageRef ,CALayer是定义在QuartzCore框架中的，CGImageRef、CGColorRef两种数据类型是定义在CoreGraphics框架中的；UIColor、UIImage是定义在UIKit框架中的。QuartzCore框架和CoreGraphics框架是可以跨平台使用的。在iOS和Mac OS X上都能使用，但是UIKit只能在iOS中使用
    
  
}
- (void)testCustomeLayer{
    
    //Method 1
    /*自定义layer*/
    TriangleLayer *triangle = [TriangleLayer layer];
    
    triangle.backgroundColor = [UIColor brownColor].CGColor;
    
    triangle.bounds = CGRectMake(0, 0, 100, 100);
    
    triangle.position = CGPointMake(100, 200);
    
    //开始绘制
    [triangle setNeedsDisplay];//这个方法才会自动触发drawinContext的方法
    
    [self.view.layer addSublayer:triangle];
    
    
    //Method 2
    CALayer *layer= [CALayer layer];
    layer.bounds = CGRectMake(0, 0,100 , 100);
    layer.position = CGPointMake(200, 200);
    layer.backgroundColor = [UIColor brownColor].CGColor;
    layer.delegate = self;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);;//填充，实心
    
    CGContextMoveToPoint(ctx, 50, 0);
    
    CGContextAddLineToPoint(ctx, 0, 100);
    
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextDrawPath(ctx, kCGPathFill);
    
    CGContextClosePath(ctx);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
