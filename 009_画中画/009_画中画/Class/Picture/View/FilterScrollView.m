//
//  FilterScrollView.m
//  009_画中画
//
//  Created by FeiXiang on 16/12/1.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import "FilterScrollView.h"
#import "FilterView.h"
#import "ConfigData.h"
#import "PictureView.h"

#define  SCREENWIDTH []UIScreen mainScren].bounds.size.width

@interface  FilterScrollView()
@property(nonatomic,retain)NSMutableArray * filterArray;
@end

@implementation FilterScrollView

-(NSMutableArray *)filterArray
{
    if (!_filterArray) {
 
        _filterArray =[ NSMutableArray array];
     
        NSArray * contentArray =@[@{@"NONE":@"None"},
                                  @{@"CIVignetteEffect":@"Effect"},
                                  @{@"CIPhotoEffectInstant":@"Instant"},
                                  @{@"CIPhotoEffectProcess":@"Process"},
                                  @{@"CIPhotoEffectTransfer":@"Transfer"},
                                  @{@"CISepiaTone":@"Tone"},
                                  @{@"CIPhotoEffectChrome":@"Chrome"},
                                  @{@"CIPhotoEffectFade":@"Fade"},
                                  @{@"CILinearToSRGBToneCurve":@"Curve"},
                                  @{@"CIPhotoEffectTonal":@"Tonal"},
                                  ];
        [_filterArray addObjectsFromArray:contentArray];
        
    }
    
    return _filterArray;
}
-(NSMutableArray *)contentArray
{
    if (!_contentArray) {
        
        _contentArray = [NSMutableArray array];
    }
    
    return _contentArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if (self) {
    
        [self setUp];
    }
    
    return self;
}

-(void)setUp
{
    self.contentSize = CGSizeMake(self.filterArray.count * (FILTERWIDTH+10), 0);
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator= NO;
    for (NSInteger index =0; index< self.filterArray.count; index++) {
        
        CGRect rect = CGRectMake(index * (FILTERWIDTH+10), 0, FILTERWIDTH, FILTERHEIGHT);
        FilterView * filterView =[[ FilterView alloc]initWithFrame:rect];
        filterView.nameLabel.text = [self.filterArray[index] allValues].firstObject;
         filterView.contentImageView.image =[ UIImage imageNamed:@"屏幕快照 2016-07-22 下午2.44.20.png"];
        
        filterView.filterDict = self.filterArray[index];
        [self.contentArray addObject:filterView];
        
        [self addSubview:filterView];
    }
}



@end
