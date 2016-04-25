//
//  JDRecommeController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDRecommeController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface JDRecommeController ()

@end

@implementation JDRecommeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableDictionary*parameters=[ NSMutableDictionary dictionary];
    parameters[@"a"]=@"category";
    parameters[@"c"]=@"subscribe";
    
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        //隐藏
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        NSLog(@"error==%@",error);
        
        
    }];
    
 }



@end
