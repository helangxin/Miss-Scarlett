//
//  JDNavigationController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDNavigationController.h"

@implementation JDNavigationController


/**
 *  自定义返回按钮，每次返回的都一样

 */

+(void)initialize
{
    [super initialize];
    UINavigationBar*navigation=[UINavigationBar appearance];
    [navigation setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics: UIBarMetricsDefault];
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
            if (self.childViewControllers.count>0)
    {
        
        UIButton *button=[[UIButton alloc]init];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
          [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size=CGSizeMake(100, 30);
        button.contentHorizontalAlignment=  UIControlContentHorizontalAlignmentLeft;
        
        [button addTarget:self action:@selector(back ) forControlEvents: UIControlEventTouchUpInside ];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
        

        //关闭底部导航栏
        //viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:animated];

    
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}
@end
