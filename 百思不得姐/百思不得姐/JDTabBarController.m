//
//  JDTabBarController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/23.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDTabBarController.h"
#import "JDNewController.h"
#import "JDMeController.h"
#import "JDEssenceController.h"
#import "JDfriendTrendsController.h"
#import "JDTabBar.h"
#import "JDNavigationController.h"


@interface JDTabBarController ()

@end

@implementation JDTabBarController
//这个类进来第一次的时候调用
+(void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    //UITabBarItem*item=[[UITabBarItem alloc]init];
    
    NSMutableDictionary*dict=[[ NSMutableDictionary alloc]init];
    dict[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    dict[NSForegroundColorAttributeName]=[UIColor grayColor];
    
    
    
    NSMutableDictionary*dict1=[[ NSMutableDictionary alloc]init];
    dict1[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    dict1[NSForegroundColorAttributeName]=[UIColor darkGrayColor];
    
    UITabBarItem *item=[UITabBarItem appearance];
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    [item setTitleTextAttributes:dict1 forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance ];
    
    [self setController:[[JDEssenceController alloc]init] andTitle:@"精华" NormalImage:@"tabBar_essence_icon" SelectImage:@"tabBar_essence_click_icon"];
   
    [self setController:[[JDNewController alloc]init] andTitle:@"新帖" NormalImage:@"tabBar_new_icon" SelectImage:@"tabBar_new_click_icon"];
    [self setController:[[JDfriendTrendsController alloc]init] andTitle:@"关注" NormalImage:@"tabBar_friendTrends_icon" SelectImage:@"tabBar_friendTrends_click_icon"];
    
      [self setController:[[JDMeController alloc]init] andTitle:@"我"NormalImage:@"tabBar_me_icon"SelectImage:@"tabBar_me_click_icon"];
    
    //更换tarbar  KVC 可以直接访问成员变量
    [self setValue:[[JDTabBar alloc]init] forKeyPath:@"tabBar"];

}

-(void)setController:(UIViewController*)vc andTitle:(NSString*)title NormalImage:(NSString*)image SelectImage:(NSString*)selectImage;
{
    vc.tabBarItem.title=title;
    vc.tabBarItem.image=[UIImage imageNamed:image];
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selectImage];
//    vc.view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(10)/100  blue:arc4random_uniform(100)/100  alpha:1];
    
    //包装自定义的导航控制器
   JDNavigationController *navc=[[JDNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navc];
   // NSLog(@"self.childViewControllers.count===%lu",(unsigned long)self.childViewControllers.count);
}


@end
