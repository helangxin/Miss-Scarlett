//
//  JDfriendTrendsController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDfriendTrendsController.h"
#import "JDRecommeController.h"

@interface JDfriendTrendsController ()

@end

@implementation JDfriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    
}
- (IBAction)pushVC:(id)sender
{
    [self.navigationController pushViewController:[JDRecommeController new] animated:YES];
}




@end
