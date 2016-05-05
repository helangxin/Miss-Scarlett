//
//  JDTabBar.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.


#import "JDTabBar.h"
#import <objc/runtime.h>
#import "JDPublishViewController.h"

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
        
        /** 添加中间按钮点击事件 */
        [button addTarget:self action:@selector(onClick ) forControlEvents:UIControlEventTouchUpInside];
        //self.button.bounds=CGRectMake(0, 0, self.button.currentBackgroundImage.size.width, self.button.currentBackgroundImage.size.height);
        [self addSubview:button];
        
        self.button=button;
        
    }
    return self;
}
-(void)onClick
{
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[JDPublishViewController new] animated:NO completion:nil];
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
