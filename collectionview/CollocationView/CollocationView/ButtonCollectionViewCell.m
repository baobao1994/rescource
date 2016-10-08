//
//  ButtonCollectionViewCell.m
//  CollocationView
//
//  Created by 郭伟文 on 16/8/15.
//  Copyright © 2016年 郭伟文. All rights reserved.
//

#import "ButtonCollectionViewCell.h"

@implementation ButtonCollectionViewCell

- (id)initWithFrame: (CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"ButtonCollectionViewCell" owner:nil options:nil] firstObject];
        [self setFrame:frame];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
