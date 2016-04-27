//
//  JDEssenceController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDEssenceController.h"
#import "JDSubViewController.h"

@interface JDEssenceController ()

@end

@implementation JDEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏的按钮和标题
    self.view.backgroundColor=JDGlobalColor;
    //self.navigationItem.title=@"百思不得姐";
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];

    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemImage:@"MainTagSubIcon" HighImage:@"MainTagSubIcon" target:self action:@selector(onClick )];
   
   
}


-(void)onClick
{
    [self.navigationController pushViewController:[JDSubViewController new] animated:YES];
}



@end
