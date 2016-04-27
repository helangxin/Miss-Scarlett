//
//  JDLoginViewController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/27.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDLoginViewController.h"

@interface JDLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@end

@implementation JDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view insertSubview:self.bgView atIndex:0];
    
}


- (IBAction)logoutBtn:(id)sender
{
  
}


/**
 *  状态栏显示白色
 *
 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return    UIStatusBarStyleLightContent ;
}

@end
