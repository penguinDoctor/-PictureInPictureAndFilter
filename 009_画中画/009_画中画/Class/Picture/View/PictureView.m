//
//  PictureView.m
//  009_画中画
//
//  Created by FeiXiang on 16/11/30.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "PictureView.h"
#import "ConfigData.h"
#import "ContentImageView.h"
#import "PictureImageView.h"
#import "BackgroundView.h"
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
@implementation PictureView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[ super initWithFrame:frame];
    
    if (self) {
               
        [self setUp];
    }
    
    return self;
}

-(void)setUp
{
    BackgroundView * backView =[[ BackgroundView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self addSubview:backView];
    
    CGRect photoFrame =  CGRectMake(188/2.0, 38/2.0, 256/2.0, 308/2.0);
    
    CGRect pictureRect = CGRectMake(SCREENWIDTH/320*photoFrame.origin.x, SCREENWIDTH/320*photoFrame.origin.y, SCREENWIDTH/320*photoFrame.size.width, SCREENWIDTH/320*photoFrame.size.height);
    
    PictureImageView * pictureImageView =[[PictureImageView alloc]initWithFrame:pictureRect];
    
    UIImage *image =[ UIImage imageNamed:@"屏幕快照 2016-07-22 下午2.44.20.png"];
    
    float scale = self.frame.size.width/image.size.width;
    ContentImageView * contentImageView =[[ ContentImageView alloc]init];
    contentImageView.frame = CGRectMake(0, 0, image.size.width *scale, image.size.height *scale);
     contentImageView.image =image;
    self.contentImageView =contentImageView;
    
    [backView addSubview:pictureImageView];
    [pictureImageView insertSubview:contentImageView belowSubview:backView];
    
}


@end
