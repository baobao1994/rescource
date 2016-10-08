//
//  XHHorizontalPageViewCell.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-23.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHPinterest;

// Block
typedef void(^XHPullDownAction)(CGPoint offset);
typedef void(^XHDidSelectedSubItemAction)(XHPinterest *currentPinterest);



@interface XHHorizontalPageViewCell : UICollectionViewCell

/**
 *  需要展示和绑定的数据Model
 */
@property (nonatomic, strong) XHPinterest *pinterest;

/**
 *  详情页面，下拉scrollView到一定程度的回调
 */
@property (nonatomic, copy) XHPullDownAction pullDownAction;

/**
 *  点击详情页面的其他item的回调
 */
@property (nonatomic, copy) XHDidSelectedSubItemAction didSelectedSubItemAction;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com