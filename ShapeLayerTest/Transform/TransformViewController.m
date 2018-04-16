//
//  TransformViewController.m
//  ShapeLayerTest
//
//  Created by sunqiaoqiao on 2018/4/16.
//  Copyright © 2018年 S. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()

@property ( nonatomic,strong ) UIView *testview;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self transformtest2];
}

- (void)transformtest2 {
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 10)];
    lab.text = @"阿斯顿看电视看书的肌肤";
    [self.view addSubview:lab];
    
    CGFloat offset  = lab.frame.size.height *0.5;
    
    lab.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0, 0), CGAffineTransformMakeTranslation(0, -offset));
    
    lab.alpha = 0;
    
    //还原
    [UIView animateWithDuration:3 animations:^{
        lab .transform = CGAffineTransformIdentity;
        lab.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0, 0), CGAffineTransformTranslate(lab.transform, 0, offset));
        lab.alpha  = 1;
        
    }];
}

- (void)transformtest1{
    
    [self.view addSubview:self.testview];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(shaketest) userInfo:nil repeats:YES];
}

- (void)shaketest{
    static NSInteger i = 0;

    i++;
    
    if (i == 5) {
        self.testview.transform = CGAffineTransformScale(self.testview.transform, 0.8, 0.8);
    }else if(i == 10) {
        self.testview.transform = CGAffineTransformTranslate(self.testview.transform, 100, 100);
    }else if(i == 15){
        self.testview.transform = CGAffineTransformIdentity;
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            if (i++ %2  == 0 ) {
                self.testview.transform = CGAffineTransformRotate(self.testview.transform, -M_PI_4);
            }else{
                self.testview.transform = CGAffineTransformRotate(self.testview.transform, M_PI_4);
            }
        }];
    }
}
#pragma mark -- lazy loading
- (UIView *)testview{
    if (!_testview) {
        _testview = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _testview.backgroundColor = [UIColor purpleColor];
    }
    return _testview;
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
