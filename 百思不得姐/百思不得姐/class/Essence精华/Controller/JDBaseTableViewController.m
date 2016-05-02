//
//  JDBaseTableViewController.m
//  百思不得姐
//
//  Created by helangxin on 16/5/2.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDBaseTableViewController.h"
#import <AFNetworking.h>
#import "JDAmuseModel.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
#import "JDAmuseViewCell.h"
#define  identifierKey @"amuseCell"

@interface JDBaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 数据数组 */
@property (nonatomic, strong) NSMutableArray *topics;

@end

@implementation JDBaseTableViewController

-(NSMutableArray *)topics
{
    if (_topics==nil)
    {
        _topics=[NSMutableArray array];
    }
    return _topics;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加刷新控件
    [self setUpRefresh];
    
    //加载数据
    [self loadData];
    
    //初始化控件
    [self setup];
}
-(void)setup
{
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDAmuseViewCell class]) bundle:nil] forCellReuseIdentifier:identifierKey];
    self.view.backgroundColor=JDGlobalColor;
    
}

-(void)setUpRefresh
{
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_header.autoChangeAlpha=YES;
    [self.tableView.mj_header beginRefreshing];
    //    self.tableView.mj_footer =[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
-(void)loadData
{
    self.page=0;
    //结束下拉
    //[self.tableView.mj_header endRefreshing];
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"data";
    parameters[@"type"]=@(self.type);
    //self.params=parameters;
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         //         if (self.params!=parameters)
         //         {
         //             return ;
         //         }
         // 存储maxtime
         self.maxtime = responseObject[@"info"][@"maxtime"];
         // NSLog(@"%@",responseObject);
         self.topics= [JDAmuseModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         [self.tableView reloadData];
         //结束刷新
         [self.tableView.mj_header endRefreshing];
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"%@",error);
     }];
    
}


//加载更多数据
-(void)loadMoreData
{
    self.page++;
    //结束下拉
    //[self.tableView.mj_header endRefreshing];
    
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"]=@"list";
    parameters[@"c"]=@"data";
    parameters[@"type"]=@(self.type);
    // NSInteger page=self.page+1;
    parameters[@"page"]=@(self.page);
    //加载下一页的参数
    parameters[@"maxtime"]=self.maxtime;
    //self.params=parameters;
    
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         //         if (self.params!=parameters)
         //         {
         //             return ;
         //         }
         // 存储maxtime
         self.maxtime = responseObject[@"info"][@"maxtime"];
         self.topics= [JDAmuseModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         //[self.topics addObject:tmpArr];
         [self.tableView reloadData];
         //结束上拉
         [self.tableView.mj_footer endRefreshing];
         //页数为0
         //self.page=page;
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         //         if (self.params!=parameters)
         //         {
         //             return ;
         //         }
         //结束刷新
         [self.tableView.mj_footer endRefreshing];
     }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDAmuseViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierKey];
    
    //获得模型
    JDAmuseModel*amuse=self.topics[indexPath.row];
    cell.amuseModel=amuse;
    return cell;
}

/**
 *  设置cell行高
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出帖子模型
    JDAmuseModel *topic = self.topics[indexPath.row];

    //返回这个模型对应的cellhight
    return  topic.cellHight;
}



@end
