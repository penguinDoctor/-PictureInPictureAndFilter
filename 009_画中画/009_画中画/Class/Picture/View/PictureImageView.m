//
//  PictureImageView.m
//  009_画中画
//
//  Created by FeiXiang on 16/12/1.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "PictureImageView.h"

@implementation PictureImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        [self setBackground];
    }
    return self;
}
-(void)setBackground
{
    self.backgroundColor =[ UIColor clearColor];
    self.userInteractionEnabled =YES;
    self.clipsToBounds =YES;
    self.userInteractionEnabled = YES;
}

@end
