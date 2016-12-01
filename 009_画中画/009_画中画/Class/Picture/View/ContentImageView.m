//
//  ContentImageView.m
//  009_画中画
//
//  Created by FeiXiang on 16/12/1.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "ContentImageView.h"

@implementation ContentImageView

 -(instancetype)initWithFrame:(CGRect)frame
{
    self =[ super initWithFrame:frame];
    
    if (self) {

        self.userInteractionEnabled  = YES;
        
        [self addGesture];
        
    }
    return self;
}
-(void)addGesture
{
    UIPanGestureRecognizer  * pan =[[ UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}
//记录上一次的x和y
float _lastTransX, _lastTransY;

-(void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint translatedPoint =[ pan translationInView:pan.view];

    if (pan.state==UIGestureRecognizerStateBegan) {
        
        _lastTransX=_lastTransY==0.0;
    }
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(translatedPoint.x- _lastTransX, translatedPoint.y-_lastTransY);
    
    CGAffineTransform newTransform = CGAffineTransformConcat(self.transform, transform);
    
    _lastTransX = translatedPoint.x;
    _lastTransY = translatedPoint.y;
    
    self.transform = newTransform;
}

@end
