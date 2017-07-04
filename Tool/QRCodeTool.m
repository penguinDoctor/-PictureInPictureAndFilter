//
//  QRCodeTool.m
//  AVFoundationDemo
//
//  Created by FeiXiang on 2017/7/3.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "QRCodeTool.h"
#import <CoreImage/CoreImage.h>
#import <AVFoundation/AVFoundation.h>

@implementation QRCodeTool
+(UIImage*)getQRCodeWithContext:(NSString *)context{
    
    //创建滤镜
    CIFilter * filter =[ CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    //给滤镜设置数据(内容要求是NSData型)
    NSData * contextData = [context dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:contextData forKey:@"inputMessage"];
    //设置容错率 (L M H 三个级别)
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    //从滤镜中取数据
    
   CIImage * outPutImage = [filter outputImage];
    //设置缩放大小
    [outPutImage imageByApplyingTransform:CGAffineTransformMakeScale(2.0f, 2.0f)];
    
    //展示数据
    UIImage * reslultImage =[UIImage imageWithCIImage:outPutImage];
    
    return  reslultImage;
}

+(NSArray<CIFeature *> *)detectQRCodeWithImage:(UIImage *)QRImage{
    
    CIImage * CI = QRImage.CIImage;
    
    //创建探测器
    CIDetector * detector =[CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    
    //取出里面的数据特征并返回出去
    return [detector featuresInImage:CI];
}

+(void)scanQRCodeWithImage:(UIImageView *)QRImage delegate:(id)delegate controller:(UIViewController *)VC scanImageview:(UIImageView*)scanImageView{
    
    //创建扫描设备(手机上有麦克风 摄像头等)
    AVCaptureDevice * scanDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    //把扫描设备作为输入设备
    AVCaptureInput * input =[[AVCaptureDeviceInput alloc]initWithDevice:scanDevice error:nil];
    
    //设置数据输出
    AVCaptureMetadataOutput * output =[[AVCaptureMetadataOutput alloc]init];
    
    //数据的输出是用来处理数据的,而处理数据是需要通过代理来进行处理,所以在这里需要设置代理来进行数据的处理
    [output setMetadataObjectsDelegate:delegate queue:dispatch_get_main_queue()];
    
    //创建会话(会话是用来管理输入和输出的)
    AVCaptureSession * session = [[AVCaptureSession alloc]init];
    
    if ([session canAddInput:input] && [session canAddOutput:output]) {
        
        [session addInput:input];
        [session addOutput:output];
    }
    
    //设置支持类型
    output.metadataObjectTypes = output.availableMetadataObjectTypes;
    
    //设置聚焦点
    [output setRectOfInterest:QRImage.frame];
    
    //设置扫描的区域
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat interestX =  scanImageView.frame.origin.x/bounds.size.width;
    CGFloat interestY = scanImageView.frame.origin.y/bounds.size.height;
    CGFloat interestW = scanImageView.frame.size.width/bounds.size.width;
    CGFloat interestH = scanImageView.frame.size.height/bounds.size.height;
    
    /**这里的坐标系是以屏幕的横方向为基准的 而且里面的值的范围为0-1*/
    [output setRectOfInterest:CGRectMake(interestY, interestX, interestH, interestW)];
    
    //添加到预览图层上面
    AVCaptureVideoPreviewLayer * previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    previewLayer.frame = VC.view.layer.bounds;
    
    [VC.view.layer insertSublayer:previewLayer atIndex:0];
    
    //开始会话
    [session startRunning];
   
}

@end
