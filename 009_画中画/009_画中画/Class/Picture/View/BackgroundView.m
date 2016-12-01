//
//  BackgroundView.m
//  009_画中画
//
//  Created by FeiXiang on 16/12/1.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView
-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    if (self) {
        
        [self setView];
    }
    return self;
}

-(void)setView
{
    self.image =[ UIImage imageNamed:@"画中画01背景.jpg"];
    self.userInteractionEnabled =YES;
    
}
@end
