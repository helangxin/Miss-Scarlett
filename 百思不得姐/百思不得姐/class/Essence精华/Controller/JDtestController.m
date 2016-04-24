//
//  JDtestController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDtestController.h"
#import "JDView1Controller.h"

@interface JDtestController ()

@end

@implementation JDtestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController pushViewController:[JDView1Controller new] animated:YES];
    self.navigationItem.title=@"jdfhkadfhdsjkfhsd";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[JDView1Controller new] animated:YES];
}


@end
