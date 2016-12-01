//
//  FilterView.h
//  009_画中画
//
//  Created by FeiXiang on 16/12/1.
//  Copyright © 2016年 飞翔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FilterView;

@protocol FilterViewDelegate <NSObject>
-(void)changeStyleWithFilterView:(FilterView*)filter dictionary:(NSDictionary *)dict;

@end

@interface FilterView : UIView

@property(nonatomic,retain)UILabel * nameLabel;
@property(nonatomic,retain)UIImageView * contentImageView;
@property(nonatomic,retain)NSDictionary * filterDict;
@property(nonatomic,weak) id<FilterViewDelegate> delegate;

-(UIImage *)filterWithImage:(UIImage *)image filterName:(NSString *)filterName;

@end
