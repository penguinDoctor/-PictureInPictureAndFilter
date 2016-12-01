//
//  FilterView.m
//  009_画中画
//
//  Created by FeiXiang on 16/12/1.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "FilterView.h"
#import "ConfigData.h"

@implementation FilterView

-(void)awakeFromNib
{
    [self setViews];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    if (self) {
        
        [self setViews];
        [self addGesture];
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
 
    _contentImageView.frame = CGRectMake(5, 5, FILTERWIDTH - 2 * 5, FILTERHEIGHT/2.0);
    _nameLabel.frame =CGRectMake(5, FILTERHEIGHT/2.0+15, FILTERWIDTH - 2 * 5, 25);
}

-(void)addGesture
{
    UITapGestureRecognizer * tap =[[ UITapGestureRecognizer alloc]initWithTarget:self  action:@selector(tap)];
    [self addGestureRecognizer:tap];
}

-(void)tap
{
    if ([self.delegate respondsToSelector:@selector(changeStyleWithFilterView:dictionary:)]) {
        [self.delegate changeStyleWithFilterView:self dictionary:self.filterDict];
    }
    
}
-(void)setViews
{
    _contentImageView =[[ UIImageView alloc]init];
    [self addSubview:_contentImageView];
    
    _nameLabel =[[ UILabel alloc]init];
    _nameLabel.font =[ UIFont systemFontOfSize:14.0f];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor magentaColor];
    [self addSubview:_nameLabel];
}
//创建黑背滤镜
-(UIImage *)filterWithImage:(UIImage *)image filterName:(NSString *)filterName
{
    CIContext * context =[ CIContext contextWithOptions:nil];
    //黑白滤镜
    CIImage *blackAndWhiteImage =[ CIImage imageWithCGImage:image.CGImage];
    
    CIFilter * filter =[ CIFilter filterWithName:filterName keysAndValues:kCIInputImageKey,blackAndWhiteImage, nil];
    if ([filterName isEqualToString:@"CIVignetteEffect"]) {
        
        CGFloat R =  MIN(image.size.width, image.size.height)*image.scale/2;
        CIVector *vct = [[CIVector alloc] initWithX:image.size.width*image.scale/2 Y:image.size.height*image.scale/2];
        [filter setValue:vct forKey:@"inputCenter"];
        [filter setValue:[NSNumber numberWithFloat:0.9] forKey:@"inputIntensity"];
        [filter setValue:[NSNumber numberWithFloat:R] forKey:@"inputRadius"];
    }
    
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[blackAndWhiteImage extent]];
    UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(cgimg);
    return newImage;
}


@end
