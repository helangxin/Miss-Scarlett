//
//  JDPictureVIew.m
//  百思不得姐
//
//  Created by helangxin on 5/3/16.
//  Copyright © 2016 helangxin. All rights reserved.
//

#import "JDPictureVIew.h"
#import <UIImageView+WebCache.h>
#import "JDShowViewController.h"
#import "JDProgressView.h"

@interface JDPictureVIew ()<NSCoding>
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
/** GIF图标 */
@property (weak, nonatomic) IBOutlet UIImageView *gifPictureView;
/** 放大按钮 */
@property (weak, nonatomic) IBOutlet UIButton *OnClickView;
/** 进度条 */
@property (weak, nonatomic) IBOutlet JDProgressView *progressView;

@end

@implementation JDPictureVIew

//封装xib
+(instancetype)pictureView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JDPictureVIew" owner:nil  options:nil]lastObject];
}
/** 模型的赋值 */
-(void)setModel:(JDAmuseModel *)model
{
    _model=model;
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:model.larger_iamge]placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize)
     {
        self.progressView.hidden=NO;
        CGFloat progress=1.0*receivedSize/expectedSize;
        //[self.progressView setProgress:progress animated:NO];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
        self.progressView.hidden=YES;
        /** 如果不是大图，就不需要绘制 */
         if (model.isBigPicture==NO)
         {
             return ;
         }
             //开启上下文
         UIGraphicsBeginImageContextWithOptions(model.pictureF.size, YES, 0.0);
        
         CGFloat width=model.pictureF.size.width;
         
//         width               height
//         image.Size.width  image.Size.height
         CGFloat height=image.size.height*width/image.size.width;
         //将下载完的image绘制到图形上下文
         [image drawInRect:CGRectMake(0, 0, width, height)];
         
         //获得上下文
        image=UIGraphicsGetImageFromCurrentImageContext();
         
         
         //关闭上下文
         UIGraphicsEndImageContext();
         
         
         
    }];
    
    
    
    
    /** 取得大图的扩展名 */
    NSString*extension=model.larger_iamge.pathExtension;
    //如果不是gif图就隐藏
   self.gifPictureView.hidden =![extension.lowercaseString isEqualToString:@"gif"];
    

    
    if (model.bigPicture)
    {
        self.OnClickView.hidden=NO;
        self.pictureView.contentMode=UIViewContentModeScaleAspectFill;
        
      
    }
    else//如果不是大图，就隐藏按钮
    {
        self.OnClickView.hidden=YES;
        self.pictureView.contentMode=  UIViewContentModeScaleToFill;
    }
    

    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask=  UIViewAutoresizingNone ;
    self.pictureView.userInteractionEnabled=YES;
    //给图片添加监听器
   [self.pictureView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)]];
}

-(void)showPicture
{
    JDShowViewController*showPicture=[[JDShowViewController alloc]init];
    /** 赋值模型 */
    showPicture.model=self.model;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicture animated:YES completion:nil];
    
}
@end
