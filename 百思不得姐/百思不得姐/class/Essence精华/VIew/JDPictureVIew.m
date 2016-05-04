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
@interface JDPictureVIew ()<NSCoding>
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
/** GIF图标 */
@property (weak, nonatomic) IBOutlet UIImageView *gifPictureView;
/** 放大按钮 */
@property (weak, nonatomic) IBOutlet UIButton *OnClickView;
/** 进度条 */
@property (weak, nonatomic) IBOutlet UIImageView *progressView;

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
    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:model.image0]];
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
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[JDShowViewController new] animated:YES completion:nil];
}
@end
