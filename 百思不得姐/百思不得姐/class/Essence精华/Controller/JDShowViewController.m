//
//  JDShowViewController.m
//  百思不得姐
//
//  Created by helangxin on 5/4/16.
//  Copyright © 2016 helangxin. All rights reserved.
//

#import "JDShowViewController.h"
#import <UIImageView+WebCache.h>


@interface JDShowViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/**  */
//@property (nonatomic, strong) UIImageView *imageView;
@property (weak, nonatomic)  UIImageView *imageView;



@end

@implementation JDShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView=[[UIImageView alloc]init];
    imageView.userInteractionEnabled=YES;
    self.scrollView.userInteractionEnabled=YES;
    
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    
    [self.scrollView addSubview:imageView];
    self.imageView=imageView;
    
   /** 屏幕宽高 */
     CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
     CGFloat screenH=[UIScreen mainScreen].bounds.size.height;
  
    
    //图片的尺寸 算出图片显示的高度
    CGFloat pictureW=screenW;
    CGFloat pictureH=pictureW*self.model.height/self.model.width;
    
    if (pictureH>screenH)//如果图片高度大于屏幕高度
    {
        imageView.frame=CGRectMake(0, 0, screenW, pictureH);
        self.scrollView.contentSize=CGSizeMake(0, pictureH);
    }
    else
    {
        imageView.size=CGSizeMake(pictureW, pictureH);
        imageView.centerY=screenH*0.5;
    }
    
      [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.model.larger_iamge]];
    
    
    

}

-(IBAction)back
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

/** 保存相册 */
- (IBAction)savePhoto
{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"保存失败");
    }
    else
    {
        NSLog(@"保存成功");
    }
}
@end
