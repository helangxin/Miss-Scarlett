//
//  JDfriendTrendsController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDfriendTrendsController.h"
#import "JDRecommendController.h"
#import "JDLoginViewController.h"

@interface JDfriendTrendsController ()

@end

@implementation JDfriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=JDGlobalColor;
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemImage:@"friendsRecommentIcon" HighImage:@"friendsRecommentIcon-click" target:self action:@selector(pushRecommend)];
    
     
}

-(void)pushRecommend
{
      [self.navigationController pushViewController:[JDRecommendController new] animated:YES];
}
- (IBAction)loginBtn:(id)sender
{
    [self presentViewController:[JDLoginViewController new] animated:YES completion:nil];
}

@end
