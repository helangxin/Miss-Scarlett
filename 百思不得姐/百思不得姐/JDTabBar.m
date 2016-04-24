//
//  JDTabBar.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDTabBar.h"

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
    for (UIView *button in self.subviews)
    {
      //  if (![button isKindOfClass:NSStringFromClass(@"UITabBarButton")]) continue;
          if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        //x坐标通过宽度乘以索引
        CGFloat buttonX=buttonW*((index>1)?index+1:index);
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index++;
    }
    
}
@end
