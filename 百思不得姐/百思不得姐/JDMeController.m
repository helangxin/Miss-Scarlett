//
//  JDMeController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDMeController.h"

@interface JDMeController ()

@end

@implementation JDMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
   self.navigationItem.title=@"我的";
    
    //添加右边两个按钮
    UIBarButtonItem*btn0=[UIBarButtonItem itemImage:@"mine-moon-icon" HighImage:@"mine-moon-icon-click" target:self action:@selector(onclick0 )];
    UIBarButtonItem*btn1=[UIBarButtonItem itemImage:@"mine-setting-icon" HighImage:@"mine-setting-icon-click" target:self action:@selector(onclick1 )];
    self.navigationItem.rightBarButtonItems=@[btn1,btn0];
}

-(void)onclick0
{
    
}
-(void)onclick1
{
    
}
@end
