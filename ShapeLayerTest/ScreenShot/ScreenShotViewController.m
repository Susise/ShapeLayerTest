//
//  ScreenShotViewController.m
//  ShapeLayerTest
//
//  Created by sunqiaoqiao on 2018/4/13.
//  Copyright © 2018年 S. All rights reserved.
//

#import "ScreenShotViewController.h"

@interface ScreenShotViewController ()

@end

@implementation ScreenShotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ScreenShot";
    
    self.view.backgroundColor = [UIColor whiteColor];
}


#pragma mark ---- 截图

- (void)testscreenshots{
    
    UIImageView *showimageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.view addSubview:showimageview];
    
    //裁剪
    UIImage *image = [UIImage imageNamed:@"1"];
    
    CGFloat rate = [UIScreen mainScreen].scale;
    
    CGImageRef newimage =  CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, 100 * rate, 100 *rate));
    
    showimageview.image =  [UIImage imageWithCGImage:newimage];
    
    
    //裁剪中心 100 * 100
    
    showimageview.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    CGImageRef centerimage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, (self.view.center.y - 100) *rate, self.view.frame.size.width * rate, 200 * rate));
    showimageview.image = [UIImage imageWithCGImage:centerimage];
    
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
