//
//  CAShpeLayerViewController.m
//  ShapeLayerTest
//
//  Created by sunqiaoqiao on 2018/4/13.
//  Copyright © 2018年 S. All rights reserved.
//

#import "CAShpeLayerViewController.h"

@interface CAShpeLayerViewController ()

@property ( nonatomic,strong ) CAShapeLayer *shapelayer;

@end

@implementation CAShpeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CAShpeLayer";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self shaplayerwithBezierpath];
    
    [self drawasingleshaplayer];
    
    [self drawaprogressbar];
    
    [self test];
    
}


- (void)shaplayerwithBezierpath{
    [self.view.layer addSublayer:self.shapelayer];
    
    [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(pathAnimation) userInfo:nil repeats:YES];
}
- (void)pathAnimation{
    static int i = 0;
    if (i++ % 2 == 0) {
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"path"];
        ani.removedOnCompletion = NO;
        ani.duration = 1;
        ani.fromValue = (__bridge id)[self getStartBezierPath].CGPath;
        ani.toValue = (__bridge id)[self getendBezierPath].CGPath;
        self.shapelayer.path = [self getendBezierPath].CGPath;
        [self.shapelayer addAnimation:ani forKey:@"ani"];
    }else{
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"path"];
        ani.removedOnCompletion = NO;
        ani.duration = 1;
        ani.fromValue = (__bridge id)[self getendBezierPath].CGPath;
        ani.toValue = (__bridge id)[self getStartBezierPath].CGPath;
        self.shapelayer.path = [self getStartBezierPath].CGPath;
        [self.shapelayer addAnimation:ani forKey:@"anim"];
        
    }
}

#pragma mark --- lazy loading

- (CAShapeLayer *)shapelayer{
    if (!_shapelayer) {

        _shapelayer = [CAShapeLayer layer];
        _shapelayer.bounds  = CGRectMake(0, 0, 200, 200);
        _shapelayer.position = self.view.center;
        _shapelayer.path = [self getStartBezierPath].CGPath;
        _shapelayer.fillColor = [UIColor clearColor].CGColor;
        _shapelayer.strokeColor = [UIColor redColor].CGColor;
        _shapelayer.lineWidth = 2.f;
        
    }
    return _shapelayer;
}

#pragma mark --- 贝塞尔曲线1
-(UIBezierPath*)getStartBezierPath{
    UIBezierPath * startPath = [UIBezierPath bezierPath];
    
    [startPath moveToPoint:CGPointMake(22.5, 2.5)];
    [startPath addLineToPoint:CGPointMake(28.32, 14.49)];
    [startPath addLineToPoint:CGPointMake(41.52, 16.32)];
    [startPath addLineToPoint:CGPointMake(31.92, 25.56)];
    [startPath addLineToPoint:CGPointMake(34.26, 38.68)];
    [startPath addLineToPoint:CGPointMake(22.5, 32.4)];
    [startPath addLineToPoint:CGPointMake(10.74, 38.68)];
    [startPath addLineToPoint:CGPointMake(13.08, 25.56)];
    [startPath addLineToPoint:CGPointMake(3.48, 16.32)];
    [startPath addLineToPoint:CGPointMake(16.68, 14.49)];
    [startPath closePath];
    
    return startPath;
}
#pragma mark --- 贝塞尔曲线2
- (UIBezierPath *)getendBezierPath{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(22.5, 2.5)];
    [path addLineToPoint:CGPointMake(32.15, 9.21)];
    [path addLineToPoint:CGPointMake(41.52, 16.32)];
    [path addLineToPoint:CGPointMake(38.12, 27.57)];
    [path addLineToPoint:CGPointMake(34.26, 38.68)];
    [path addLineToPoint:CGPointMake(22.5, 38.92)];
    [path addLineToPoint:CGPointMake(10.74, 38.68)];
    [path addLineToPoint:CGPointMake(6.88, 27.57)];
    [path addLineToPoint:CGPointMake(3.48, 16.32)];
    [path addLineToPoint:CGPointMake(12.85, 9.21)];
    return path;
}



#pragma mark -- 画一个简单的shapelayer
- (void)drawasingleshaplayer{
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor orangeColor].CGColor;//填充颜色
    [self.view.layer addSublayer:layer];
    
    UIBezierPath *bez = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:60 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    layer.path = bez.CGPath;
    
    
}

#pragma mark ----- 画一个进度条
- (void)drawaprogressbar{
    
    /*
     */

    CAShapeLayer *normalLayer  = [CAShapeLayer layer];
    normalLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    normalLayer.frame = CGRectMake(10, 300, 200, 10);
    normalLayer.cornerRadius = 5;
    [self.view.layer addSublayer:normalLayer];
    
//    CAShapeLayer *progresslayer = [CAShapeLayer layer];
//    progresslayer.cornerRadius = 5;
//    progresslayer.fillColor = [UIColor purpleColor].CGColor;
//    progresslayer.strokeColor = [UIColor redColor].CGColor;
//    progresslayer.lineWidth = 10;
//    [self.view.layer addSublayer:progresslayer];

}
- (void)test{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    [path moveToPoint:CGPointMake(10, 305)];
    [path addLineToPoint:CGPointMake(210, 305)];
//    [path addLineToPoint:CGPointMake(300, 667/2)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    animation.duration = 5;
    //动画起始位置
    animation.fromValue = @(0);
    //动画结束位置
    animation.toValue = @(1);
    //动画重复次数
    animation.repeatCount = 100;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor orangeColor].CGColor;
    layer.strokeColor = [UIColor blueColor].CGColor;
    layer.path = path.CGPath;
    layer.cornerRadius =  10;
    layer.lineWidth = 10.0;
    layer.lineCap  = kCALineCapRound;
    [self.view.layer addSublayer:layer];
    //设置图形的弧度
    //    layer.strokeStart = 0;
    //    layer.strokeEnd = 0;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
    
    
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
