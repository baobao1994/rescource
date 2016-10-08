//
//  XHPinterestTransition.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-14.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XHTransitionProtocol.h"

#import "UICollectionView+XHIndexPath.h"
#import "UIView+XHViewFrame.h"
#import "XHUIKitMacro.h"

@interface XHPinterestTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  缩放参数
 */
@property (nonatomic, assign) CGFloat animationScale;

/**
 *  动画参数
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *  用于可交互性的控制数据，不过有个bug，后续找方案解决
 */
@property (nonatomic, assign) BOOL canceled;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com