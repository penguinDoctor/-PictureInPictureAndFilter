//
//  RootViewController.m
//  009_画中画
//
//  Created by FeiXiang on 16/11/30.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "RootViewController.h"
#import "PictureView.h"
#import "ConfigData.h"
#import "FilterScrollView.h"
#import "FilterView.h"
#import "ContentImageView.h"
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define  SCREENHEIGTH [UIScreen mainScreen].bounds.size.height

@interface RootViewController ()<FilterViewDelegate>

@property(nonatomic,retain)FilterScrollView * filterScrollView;
@property(nonatomic,retain)PictureView * pictureView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}
-(FilterScrollView *)filterScrollView
{
    if (!_filterScrollView)
    {
        CGRect rect = CGRectMake(0, 84 + (SCREENWIDTH/320 * 192) + 20, SCREENWIDTH, FILTERHEIGHT);
         _filterScrollView =[[ FilterScrollView alloc]initWithFrame:rect];
    }
    
    return _filterScrollView;
}

//画中画
- (IBAction)PictureAction:(UIButton *)sender {
    
    [self setPictureViewImageView];
}

-(void)setPictureViewImageView
{
    CGRect rect = CGRectMake(0, 84, SCREENWIDTH, SCREENWIDTH/320 * 192);
    PictureView * pictureView =[[PictureView alloc]initWithFrame:rect];
    pictureView.backgroundColor =[ UIColor greenColor];
    self.pictureView = pictureView;
    [self.view addSubview:pictureView];
}

//滤镜
- (IBAction)filterAction:(id)sender {
    
    [self.view addSubview:self.filterScrollView];
    //遍历数组 找到每一个fitlerView
    [self addFilterWithArray];
}

-(void)addFilterWithArray
{
    for (FilterView *filter in self.filterScrollView.contentArray) {
 
        filter.delegate =self;
    }
}

-(void)changeStyleWithFilterView:(FilterView *)filter dictionary:(NSDictionary *)dict
{
    ContentImageView * contentImageView = self.pictureView.contentImageView;
    
    NSString* filterName = [filter.filterDict allKeys].firstObject;
    UIImage * contentImage =[ filter filterWithImage:contentImageView.image filterName:filterName];
    contentImageView.image = contentImage;
}

@end
