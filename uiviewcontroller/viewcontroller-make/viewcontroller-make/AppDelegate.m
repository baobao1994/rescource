//
//  AppDelegate.m
//  viewcontroller-make
//
//  Created by 翁舟洋 on 15/11/13.
//  Copyright © 2015年 福州博瑞思创教育科技有限公司 - 课堂案例. All rights reserved.
//

#import "AppDelegate.h"
#import "BRViewController.h"
#import "BRTwoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"call to make a new window!");
    
//    UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    win.backgroundColor = [UIColor whiteColor];
//    self.window = win;
    
   // [self.window makeKeyAndVisible]; //设置当前窗口为主窗口，同时显示出来
    
//    UITextField *tf = [[UITextField alloc] init];
//    tf.frame = CGRectMake(20, 20, 100, 30);
//    tf.borderStyle = UITextBorderStyleRoundedRect;
//    [self.window addSubview:tf];
    
    
//    UIWindow *win2 = [[UIWindow alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
//    win2.backgroundColor = [UIColor redColor];
//    self.window2 = win2;
//    [self.window2 makeKeyAndVisible];
    
    
      //自己构建一个全屏幕window对象，然后创建ViewController(作为rootViewController），然后给予一个默认的VIEW, 设置其背景为蓝色。
//      UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//      win.backgroundColor = [UIColor whiteColor];
//      self.window = win;
//
        //默认会构建一个空白的VIEW
//      UIViewController *vc = [[UIViewController alloc] init];
//      self.window.rootViewController = vc;
//      vc.view.backgroundColor = [UIColor blueColor];
//    
//      UITextField *tf = [[UITextField alloc] init];
//      tf.frame = CGRectMake(20, 20, 100, 30);
//      tf.borderStyle = UITextBorderStyleRoundedRect;
//      [self.window addSubview:tf];
//      [vc.view addSubview:tf];
//    
//      [self.window makeKeyAndVisible];
    
    
          //让stroyboard来构建界面
//        UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        win.backgroundColor = [UIColor whiteColor];
//        self.window = win;
//    
//        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; //不设置bundle,默认就是mainBundle
//    
//        //UIViewController *vc = [storyBoard instantiateInitialViewController];
//        UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"blueVC"];
//        self.window.rootViewController = vc;
//    
//        [self.window makeKeyAndVisible];
    
    
            //如果你指定了Main stroyboard, 那么如下代码将由系统自动书写
//            UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//            win.backgroundColor = [UIColor whiteColor];
//            self.window = win;
//    
//            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            self.window.rootViewController = vc;
    
//            [self.window makeKeyAndVisible];
    
    
    //指定storyboard返回回来的viewController所属的类，并设置事件处理方法
//    UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    win.backgroundColor = [UIColor whiteColor];
//    self.window = win;
//    
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; //不设置bundle,默认就是mainBundle
//    
//    //UIViewController *vc = [storyBoard instantiateInitialViewController];
//    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"blueVC"];
//    
//    NSLog(@"%@",vc);
//    
//    self.window.rootViewController = vc;
//    
//    [self.window makeKeyAndVisible];
    
    //使用xib构建viewContrller
    UIWindow *win = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    win.backgroundColor = [UIColor whiteColor];
    self.window = win;
    
    //向这个XIB文件要一个VIEW
    BRTwoViewController *vc = [[BRTwoViewController alloc] initWithNibName:@"testview" bundle:nil];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    
    //学习顺序
    // 1. 全手工打造VC
    // 2. 使用XIB辅助打造VC (界面生成交给XIB，助于XIB中可能有多个界面，需要指定，设置XIB file‘s owner和view outlet
    // 3. 使用storyboard辅助打造VC (storyboard可能包含多个控制器，需要指定控制器的storyboard id,或者使用initViewController
    // 4. 全部使用storyboard构建VC。
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
