//
//  UIBarButtonItem+JDBarButtonItem.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "UIBarButtonItem+JDBarButtonItem.h"

@implementation UIBarButtonItem (JDBarButtonItem)

//封装BarbuttonItem
+(instancetype)itemImage:(NSString*)image HighImage:(NSString*)highImage target:(id)target action:(SEL)action
{
    UIButton *button=[[UIButton alloc]init];
    
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size=button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents: UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:button];
}


@end

