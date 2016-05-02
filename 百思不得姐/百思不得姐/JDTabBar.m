//
//  JDTabBar.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
/*
 
 2016-04-28 00:27:41.232 百思不得姐[45517:1211302] -[JDTabBar layoutSubviews]
 2016-04-28 00:27:41.233 百思不得姐[45517:1211302] hehe
 (lldb) po button
 error: use of undeclared identifier 'button'
 error: 1 errors parsing expression
 (lldb) po button
 0x00000001041ad320
 
 (lldb) po button
 <_UITabBarBackgroundView: 0x7fdc41f563e0; frame = (0 0; 375 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fdc41f1b120>>
 
 (lldb) po button
 <UIButton: 0x7fdc41f4c8c0; frame = (75 0; 75 49); opaque = NO; layer = <CALayer: 0x7fdc41f11d40>>
 
 (lldb) po button
 <UITabBarButton: 0x7fdc41cbe750; frame = (225 0; 75 49); opaque = NO; layer = <CALayer: 0x7fdc41e8ca80>>
 
 (lldb) po button
 <UITabBarButton: 0x7fdc41cbe750; frame = (225 0; 75 49); opaque = NO; layer = <CALayer: 0x7fdc41e8ca80>>
 
 (lldb) po button
 <UITabBarButton: 0x7fdc41f596a0; frame = (300 0; 75 49); opaque = NO; layer = <CALayer: 0x7fdc41e0be00>>
 
 (lldb) po button
 <UITabBarButton: 0x7fdc41e908a0; frame = (375 0; 75 49); opaque = NO; layer = <CALayer: 0x7fdc41d049c0>>
 
 (lldb) po button
 <UITabBarButton: 0x7fdc41d4bbe0; frame = (450 0; 75 49); opaque = NO; layer = <CALayer: 0x7fdc41d4c2c0>>
 
 (lldb) po button
 <UIImageView: 0x7fdc41e4a740; frame = (525 0; 75 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fdc41e11390>>
 
 2016-04-28 00:34:15.570 百思不得姐[45517:1211302] -[JDTabBar layoutSubviews]
 2016-04-28 00:34:15.571 百思不得姐[45517:1211302] hehe
 */

/*
 (lldb) po button
 <_UITabBarBackgroundView: 0x7fb052da9d90; frame = (0 0; 375 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fb052f18510>>
 
 (lldb) po button
 <UIButton: 0x7fb052f3a7c0; frame = (50.5 -14.7; 49 49); opaque = NO; layer = <CALayer: 0x7fb052f34d40>>
 
 (lldb) po button
 <UITabBarButton: 0x7fb052e3d9a0; frame = (2 1; 90 48); opaque = NO; layer = <CALayer: 0x7fb052cb1bc0>>
 
 (lldb) po button
 <UITabBarButton: 0x7fb052e3d9a0; frame = (0 0; 75 49); opaque = NO; layer = <CALayer: 0x7fb052cb1bc0>>
 
 (lldb) po button
 <UITabBarButton: 0x7fb052dd1db0; frame = (96 1; 90 48); opaque = NO; layer = <CALayer: 0x7fb052cc2700>>
 
 (lldb) po button
 <UITabBarButton: 0x7fb052cc5f60; frame = (190 1; 89 48); opaque = NO; layer = <CALayer: 0x7fb052cc36c0>>
 
 (lldb) po button
 <UITabBarButton: 0x7fb052cc9940; frame = (283 1; 90 48); opaque = NO; layer = <CALayer: 0x7fb052e02ca0>>
 
 (lldb) po button
 <UITabBarButton: 0x7fb052cc9940; frame = (300 0; 75 49); opaque = NO; layer = <CALayer: 0x7fb052e02ca0>>
 
 (lldb) po button
 <UIImageView: 0x7fb052e131d0; frame = (0 -0.5; 375 0.5); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fb052e3c990>>

 */

#import "JDTabBar.h"
#import <objc/runtime.h>

@interface JDTabBar ()
@property (nonatomic, weak) UIButton *button;

@end

@implementation JDTabBar

#pragma mark ---添加按钮
-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame])
    {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateHighlighted];
        //self.button.bounds=CGRectMake(0, 0, self.button.currentBackgroundImage.size.width, self.button.currentBackgroundImage.size.height);
        [self addSubview:button];
        
        self.button=button;
        
    }
    return self;
}


#pragma mark ---布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
    //[self getIvars];
    //NSLog(@"%s", __FUNCTION__);
    //NSLog(@"hehe");
    //设置按钮的属性
    self.button.bounds=CGRectMake(0, 0, self.button.currentBackgroundImage.size.width, self.button.currentBackgroundImage.size.height);
    //self.center=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    self.button.center=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    
     /**
     *  用分类来重写后的UIView
     */
    CGFloat width=self.width;
    CGFloat heigth=self.height;
    
    CGFloat buttonY=0;
       CGFloat buttonH=heigth;
       CGFloat buttonW=width/5;
    NSInteger index=0;
   
    for (UIButton*button in self.subviews)
    {
    //if (![button isKindOfClass:NSStringFromClass(@"UITabBarButton")]) continue;
          if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")])continue ;
        
        //x坐标通过宽度乘以索引
        CGFloat buttonX=buttonW*((index>1)?index+1:index);
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index++;
    
    }
       // NSLog(@"%lu",(unsigned long)self.subviews.count);
    
}
//+(void)initialize
//{
//    [self getIvars];
//}
//-(void)getIvars
//{
//    unsigned int count = 0;
//    
//    // 拷贝出所有的成员变量列表
//    Ivar *ivars = class_copyIvarList([JDTabBar class], &count);
//    
//    for (int i = 0; i<count; i++) {
//        // 取出成员变量
//        //        Ivar ivar = *(ivars + i);
//        Ivar ivar = ivars[i];
//        
//        // 打印成员变量名字
//         NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
//    }
//    
//    // 释放
//    free(ivars);
//}
@end
