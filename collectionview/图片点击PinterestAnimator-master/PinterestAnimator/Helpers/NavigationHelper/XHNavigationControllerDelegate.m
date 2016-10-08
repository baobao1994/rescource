//
//  XHNavigationControllerDelegate.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHNavigationControllerDelegate.h"

#import "XHPinterestPushTransition.h"
#import "XHPinterestPopTransition.h"

@interface XHNavigationControllerDelegate ()

@property (nonatomic, strong) XHPinterestPushTransition *pinterestPushTransition;

@property (nonatomic, strong) XHPinterestPopTransition *pinterestPopTransition;

@property (nonatomic, weak) UINavigationController *navigationController;

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

@property (nonatomic, assign) BOOL panGestureRecognizerEnable;


@end

@implementation XHNavigationControllerDelegate

#pragma mark - Propertys

- (XHPinterestPushTransition *)pinterestPushTransition {
    if (!_pinterestPushTransition) {
        _pinterestPushTransition = [[XHPinterestPushTransition alloc] init];
    }
    return _pinterestPushTransition;
}

- (XHPinterestPopTransition *)pinterestPopTransition {
    if (!_pinterestPopTransition) {
        _pinterestPopTransition = [[XHPinterestPopTransition alloc] init];
    }
    return _pinterestPopTransition;
}

#pragma mark - Life Cycle

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
                  panGestureRecognizerEnable:(BOOL)panGestureRecognizerEnable {
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
        
        self.navigationController.delegate = self;
        
        self.panGestureRecognizerEnable = panGestureRecognizerEnable;
        if (self.panGestureRecognizerEnable) {
            UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureRecognizer:)];
            
            [self.navigationController.view addGestureRecognizer:panGestureRecognizer];
        }
    }
    return self;
}

#pragma mark - UIPanGestureRecognizer Helper Method

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            CGPoint location = [panGestureRecognizer locationInView:panGestureRecognizer.view];
            if (location.y > 0 && self.navigationController.viewControllers.count > 1) {
                self.interactionController = [UIPercentDrivenInteractiveTransition new];
                [self.navigationController popViewControllerAnimated:YES];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
            // fabs() 求浮点数的绝对值
            CGFloat d = fabs(translation.y / CGRectGetHeight(panGestureRecognizer.view.bounds));
            [self.interactionController updateInteractiveTransition:d];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateEnded: {
            CGPoint velocity = [panGestureRecognizer velocityInView:panGestureRecognizer.view];
            if (velocity.y > 80) {
                self.pinterestPopTransition.canceled = NO;
                [self.interactionController finishInteractiveTransition];
            } else {
                self.pinterestPopTransition.canceled = YES;
                [self.interactionController cancelInteractiveTransition];
            }
            self.interactionController = nil;
            break;
        }
        default:
            break;
    }
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.pinterestPushTransition;
    } else if (operation == UINavigationControllerOperationPop) {
        return self.pinterestPopTransition;
    } else {
        return nil;
    }
}

#pragma mark - UIViewControllerInteractiveTransitioning

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.panGestureRecognizerEnable) {
        return self.interactionController;
    } else {
        return nil;
    }
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com