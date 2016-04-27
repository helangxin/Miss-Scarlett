//
//  JDRecommeController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//1.在XIB中拖线设置了代理和数据源方法

#import "JDRecommendController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "JDRecommendModel.h"
#import "JDTRecommendViewCell.h"
#import "JDUserTableViewCell.h"
#import <MJRefresh.h>

@interface JDRecommendController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *recommendTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

/** 左边的类型模型数组 */
@property (nonatomic, strong) NSArray *recommendArr;




@end

@implementation JDRecommendController : UIViewController

#define identifierKey @"hehe"
#define identifierUser @"xin"
- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化控件
    [self setupTableView];
    //添加刷新控件
    [self setupRefresh];
    //加载左侧数据
    [self loadCategary];
  
    
 }
-(void)setupTableView
{
    /**
     *  注册cell
     */
    [self.recommendTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDTRecommendViewCell class]) bundle:nil] forCellReuseIdentifier:@"hehe"];
    
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDUserTableViewCell class]) bundle:nil] forCellReuseIdentifier:identifierUser];
    
    self.navigationItem.title=@"推荐关注";
    self.view.backgroundColor=JDGlobalColor;
}
-(void)loadCategary
{
    
    
    NSMutableDictionary*parameters=[ NSMutableDictionary dictionary];
    parameters[@"a"]=@"category";
    parameters[@"c"]=@"subscribe";
    //显示指示器
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",responseObject[@"list"]);
        
        
        
        //隐藏
        [SVProgressHUD dismiss];
        //将服务器返回的json数据字典转模型
        ///'objectArrayWithKeyValuesArray:' is deprecated: first deprecated in iOS 2.0 - 请在方法名前面加上mj_前缀，使用mj_***
        
        self.recommendArr=[JDRecommendModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表格
        [self.recommendTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        NSLog(@"error==%@",error);
        
        
    }];
}

-(void)setupRefresh
{
    self.userTableView.mj_footer=[MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footrefresh )];
   // self.userTableView.footer.hidden=YES;
   
}
-(void)footrefresh
{
    NSLog(@"hehe");
}
#pragma mark ---实现数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_recommendTableView)
    {
        return  self.recommendArr.count;
    }
    else
    {   //取出左边的数组对应的模型
      JDRecommendModel *c=self.recommendArr[self.recommendTableView.indexPathForSelectedRow.row];
        //控制每次点击左边类别，刷新的出现和隐藏
        //self.userTableView.mj_footer.hidden=YES;
        return c.users.count;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.recommendTableView)
    {
        JDTRecommendViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"hehe"];
        
        //赋值
        cell.category=self.recommendArr[indexPath.row];
        
        return cell;
    }
    else
    {
        JDUserTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identifierUser];
        JDRecommendModel *c=self.recommendArr[self.recommendTableView.indexPathForSelectedRow.row];
        cell.userModel=c.users[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
          JDRecommendModel*c=self.recommendArr[indexPath.row];
    //如果有数据，就直接刷新
    if (c.users.count)
    {
        [self.userTableView reloadData];
    }
    else
    {
        //刷新表格，加载数据
        [self.userTableView reloadData];
        NSMutableDictionary*parameters=[ NSMutableDictionary dictionary];
        parameters[@"a"]=@"list";//数据
        parameters[@"c"]=@"subscribe";//请求头
        parameters[@"category_id"]=@(c.id);
        //获取请求
        [[AFHTTPSessionManager manager]GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
            NSArray *arr=[JDUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
             //将字典转模型的数组保存到类别数组中，为了解决重复发请求的问题
             [c.users addObjectsFromArray:arr];
             [self.userTableView reloadData];
            // NSLog(@"%@",responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"%@",error);
         }];
    }

   }
//1.重复发请求
//2页面只有一页
//
@end
