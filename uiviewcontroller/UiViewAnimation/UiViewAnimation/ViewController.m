//
//  ViewController.m
//  UiViewAnimation
//
//  Created by 郭伟文 on 16/8/15.
//  Copyright © 2016年 郭伟文. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    _label.text = @"ddkkkkdkd";
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    [self runAnimateKeyframes];//类似彩虹效果
        // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Animation:(UIButton *)sender {
    //类似弹窗的效果
    [UIView animateWithDuration:4.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:6.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint point = _label.center;
        point.y += 150;
        _label.center = point;
        [_label setAlpha:0.5];
    } completion:^(BOOL finished) {
        [_label setAlpha:1];
    }];
}

- (void)runAnimateKeyframes {
    
    void (^keyFrameBlock)() = ^(){
        // 创建颜色数组
        NSArray *arrayColors = @[[UIColor orangeColor],
                                 [UIColor yellowColor],
                                 [UIColor greenColor],
                                 [UIColor blueColor],
                                 [UIColor purpleColor],
                                 [UIColor redColor]];
        NSUInteger colorCount = [arrayColors count];
        // 循环添加关键帧
        for (NSUInteger i = 0; i < colorCount; i++) {
            [UIView addKeyframeWithRelativeStartTime:i / (CGFloat)colorCount
                                    relativeDuration:1 / (CGFloat)colorCount
                                          animations:^{
                                              [self.colorView setBackgroundColor:arrayColors[i]];
                                          }];
        }
    };

    /**
     *  relativeDuration  动画在什么时候开始
     *  relativeStartTime 动画所持续的时间
     */
    
    [UIView animateKeyframesWithDuration:6.f
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations: keyFrameBlock
//                                  ^{
//                                  [UIView addKeyframeWithRelativeStartTime:0.0   // 相对于6秒所开始的时间（第0秒开始动画）
//                                                          relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
//                                                                animations:^{
//                                                                    self.view.backgroundColor = [UIColor redColor];
//                                                                }];
//                                  
//                                  [UIView addKeyframeWithRelativeStartTime:1/3.0 // 相对于6秒所开始的时间（第2秒开始动画）
//                                                          relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
//                                                                animations:^{
//                                                                    self.view.backgroundColor = [UIColor yellowColor];
//                                                                }];
//                                  [UIView addKeyframeWithRelativeStartTime:2/3.0 // 相对于6秒所开始的时间（第4秒开始动画）
//                                                          relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
//                                                                animations:^{
//                                                                    self.view.backgroundColor = [UIColor greenColor];                                                                }];
//                                  
//                              }
                              completion:^(BOOL finished) {
                                  [self runAnimateKeyframes];
                              }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
