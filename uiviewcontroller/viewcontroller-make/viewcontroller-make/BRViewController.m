//
//  BRViewController.m
//  viewcontroller-make
//
//  Created by 翁舟洋 on 15/11/13.
//  Copyright © 2015年 福州博瑞思创教育科技有限公司 - 课堂案例. All rights reserved.
//

#import "BRViewController.h"

@interface BRViewController ()
- (IBAction)doIt:(UIButton *)sender;

@end

@implementation BRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)doIt:(UIButton *)sender {
    NSLog(@"do it now!");
}
@end
