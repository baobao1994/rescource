//
//  XHPinterest.m
//  PinterestExample
//
//  Created by dw_iOS on 14-8-12.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHPinterest.h"

@implementation XHPinterest

- (instancetype)initWithImageName:(NSString *)imageName
                            title:(NSString *)title {
    self = [super init];
    if (self) {
        if (imageName) {
            self.image = [UIImage imageNamed:imageName];
        }
        self.title = title;
    }
    return self;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com