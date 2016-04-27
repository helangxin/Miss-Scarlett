//
//  JDSubViewController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/26.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDSubViewController.h"
#import <AFHTTPSessionManager.h>
#import "JDSubTableViewCell.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>


#define subIdentifier @"subCell"

@interface JDSubViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *subTableView;
/** subArr */
@property (nonatomic, strong) NSArray *subArr;

@end

@implementation JDSubViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化子控件
    [self setup];
    
    [self loadData];
    
}
 //初始化子控件
-(void)setup
{
    
    self.subTableView.rowHeight=70;
    self.view.backgroundColor=JDGlobalColor;
    self.subTableView.backgroundColor=JDGlobalColor;
    
}

-(void)loadData
{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"tag_recommend";
    parameters[@"c"]=@"topic";
    parameters[@"action"] = @"sub";
    //注册cell
    [self.subTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDSubTableViewCell class]) bundle:nil] forCellReuseIdentifier:subIdentifier];
    
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         //字典转模型
         self.subArr=[JDSubModel mj_objectArrayWithKeyValuesArray:responseObject];
         //刷新数据
         [self.subTableView reloadData];
         [SVProgressHUD dismiss];
         NSLog(@"%@",responseObject);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [SVProgressHUD showErrorWithStatus:@"加载失败"];
     }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDSubTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:subIdentifier];
    
    //赋值
    cell.subModel=self.subArr[indexPath.row];
    
    return cell;
}


@end
