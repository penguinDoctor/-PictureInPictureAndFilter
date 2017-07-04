//
//  QRCodeTool.h
//  AVFoundationDemo
//
//  Created by FeiXiang on 2017/7/3.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**二维码工具类*/
@interface QRCodeTool : NSObject
/**生成二维码*/
+(UIImage*)getQRCodeWithContext:(NSString*)context;
/**识别二维码*/
+(NSArray<CIFeature*>*)detectQRCodeWithImage:(UIImage*)QRImage;
/**扫描二维码*/
+(void)scanQRCodeWithImage:(UIImageView *)QRImage delegate:(id)delegate controller:(UIViewController *)VC scanImageview:(UIImageView*)scanImageView;

@end
