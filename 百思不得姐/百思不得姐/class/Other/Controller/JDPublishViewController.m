//
//  JDPublishViewController.m
//  百思不得姐
//
//  Created by helangxin on 5/5/16.
//  Copyright © 2016 helangxin. All rights reserved.
//

#import "JDPublishViewController.h"
#import "JDLoginButton.h"

@interface JDPublishViewController ()

@end

@implementation JDPublishViewController
- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /** 初始化控件 */
    [self setup];
    
    
    
   
}

-(void)setup
{
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    imageView.centerX=JDScreenW*0.5;
    imageView.y=JDScreenH*0.2;
    
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    
    int  maxCols=3;
    
    CGFloat buttonW=72;
    CGFloat buttonH=buttonW+30;
   
    CGFloat buttonStartX=15;
    
     CGFloat buttonMargin =(JDScreenW-2*buttonStartX-maxCols*buttonW)/(maxCols-1);
    
    CGFloat buttonStartY=(JDScreenH-2*buttonH)*0.5;
    
    
    for (int i=0; i<images.count; i++)
    {
        JDLoginButton *button=[[JDLoginButton  alloc]init];
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        [button setTitle:titles[i ] forState:  UIControlStateNormal ];
        [button setTitleColor:[UIColor blackColor] forState:  UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i ]]forState:UIControlStateNormal];
        
        button.width=buttonW;
        button.height=buttonH;
        int row=i/maxCols;
        int col =i%maxCols;
        button.x=buttonStartX+col*(buttonW+buttonMargin);
        button.y=buttonStartY +row*buttonH;
        [self.view addSubview: button];
        
    }
    
    
    
    
    [self.view addSubview:imageView];
    
}



@end
