//
//  JDEssenceController.m
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDEssenceController.h"
#import "JDSubViewController.h"
#import "JDBaseTableViewController.h"
//#import "JDTopTableController.h"
@interface JDEssenceController ()<UIScrollViewDelegate>

/** 标签的view */
@property (nonatomic, weak) UILabel *titleView;
/** 标签按钮 */
@property (nonatomic, weak) UIButton *button;

/** 红色底部标签*/
@property (nonatomic, weak) UIView *redView;

/** 当前选中状态 */
@property (nonatomic, strong) UIButton *selectBtn;

/** 底部的滚动View */
@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation JDEssenceController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNvaView];
    //添加子控制器
    [self addController ];
    //设置标签栏
    [self setupTitleView];
    //设置底部scrollView
    [self setupScrollView];
  

}

/**
 * 添加子控制器
 */
#pragma mark--添加子控制器
-(void)addController
{
  JDBaseTableViewController*allVc=[[  JDBaseTableViewController alloc]init];
      allVc.type=JDTopicTypeAll;
    [self addChildViewController:allVc];
  
    
    
   JDBaseTableViewController*vedioVc=[[ JDBaseTableViewController alloc]init];
    vedioVc.type=JDTopicTypeVideo;
    [self addChildViewController:vedioVc];
    
    
    JDBaseTableViewController*voiceVc=[[ JDBaseTableViewController alloc]init];
    voiceVc.type=JDGTopicTypeVoice;
    [self addChildViewController:voiceVc];
    
   JDBaseTableViewController*pictureVc=[[  JDBaseTableViewController alloc]init];
    pictureVc.type=JDTopicTypePicture;
    [self addChildViewController:pictureVc];
    
 JDBaseTableViewController *amuseVc=[[ JDBaseTableViewController alloc]init];
    amuseVc.type=JDTopicTypeWord;
    [self addChildViewController:amuseVc];
    
    
}
#pragma mark--设置底部scrollView
-(void)setupScrollView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.frame=self.view.bounds;

    
   [self.view addSubview:scrollView];
    scrollView.delegate=self;
    scrollView.pagingEnabled=YES;
    [self.view insertSubview:scrollView atIndex:0];
    scrollView.contentSize=CGSizeMake(scrollView.width*self.childViewControllers.count,0);
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView=scrollView;
    

    
    //滚动到第一个
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    
}

-(void)setupNvaView
{
    //设置导航栏的按钮和标题
    self.view.backgroundColor=JDGlobalColor;
    //self.navigationItem.title=@"百思不得姐";
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemImage:@"MainTagSubIcon" HighImage:@"MainTagSubIcon" target:self action:@selector(onClick )];
}

-(void)setupTitleView
{
    //添加标签栏
    UIView *titleLabelView=[[UIView alloc]init];
    titleLabelView.backgroundColor=[UIColor greenColor];
//    titleLabelView.x=0;
    titleLabelView.y=44;
    titleLabelView.height=45;
    titleLabelView.width=self.view.width;
    titleLabelView.frame=CGRectMake(titleLabelView.x, titleLabelView.y, titleLabelView.width,  titleLabelView.height);
  // Incompatible pointer types assigning to 'UILabel *' from 'UIView *'
    self.titleView=titleLabelView;
    //设置透明
    titleLabelView.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.5];
    
   
    //添加红色底部标签
    UIView*redView=[[UIView alloc]init];
    redView.x=0;
    redView.y=titleLabelView.y-redView.height;
    redView.height=2;
    redView.tag=-1;
    redView.width=titleLabelView.width/5;
    redView.frame=CGRectMake(redView.x, redView.y, redView.width, redView.height);
    self.redView=redView;
    redView.backgroundColor=[UIColor redColor];

    
   
    
    NSArray *titleArr=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    
    for (int i=0; i<titleArr.count; i++)
    {
        UIButton *titleBtn=[[UIButton alloc]init];
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        //设置frame
        titleBtn.width=titleLabelView.width/5;
        titleBtn.height=titleLabelView.height;
        titleBtn.x=i*titleBtn.width;
        titleBtn.y=10;
        titleBtn.tag=i  ;
        titleBtn.frame=CGRectMake( titleBtn.x, titleBtn.y,  titleBtn.width, titleBtn.height);
        [titleBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        //设置颜色
        [titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [titleBtn addTarget:self action:@selector(ButtonOnClick:) forControlEvents: UIControlEventTouchUpInside];
        [titleLabelView addSubview:titleBtn];
        
        //设置的底部红色标签的点击
        if (i==0)
        {
            //如果是第一个，则这个按钮不能被点中
            titleBtn.enabled=NO;
            //让它成为选中按钮
            self.selectBtn=titleBtn;
            [titleBtn.titleLabel sizeToFit];
            self.redView.width=titleBtn.titleLabel.width;
            self.redView.centerX=titleBtn.centerX;
        }
         [self.view addSubview:titleLabelView];
    }
    
        [titleLabelView addSubview:redView];
}

#pragma mark--按钮的点击
-(void)ButtonOnClick:(UIButton*)button
{
    //让当前选中状态的按钮取消选中
    self.selectBtn.enabled=YES;
    button.enabled=NO;
    self.selectBtn=button;
    
    [UIView animateWithDuration:0.4 animations:^{
        self.redView.width=button.titleLabel.width;
        self.redView.centerX=button.centerX;
    }];
    
    //设置滚动
    CGPoint offset=self.scrollView.contentOffset;
    offset.x=self.scrollView.width*button.tag;
    
    [self.scrollView setContentOffset:offset animated:YES];

}
-(void)onClick
{
    [self.navigationController pushViewController:[JDSubViewController new] animated:YES];
}
//点击后动画结束时调用
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
   // NSLog(@"%f",scrollView.contentOffset.x);
    //获得当前的索引
    NSInteger index=scrollView.contentOffset.x/scrollView.width;
    //NSLog(@"%ld",(long)index);
    UITableViewController*vc=self.childViewControllers[index];
//    //设置vc的frame
    vc.view.x=scrollView.contentOffset.x;
    vc.view.y=0;
    //NSLog(@"%f",scrollView.contentOffset.x);
    vc.view.height=scrollView.height;
    
    //设置内间距
    CGFloat bottom=self.tabBarController.tabBar.height;
    CGFloat top=CGRectGetMaxY(self.titleView.frame);
    vc.tableView.contentInset=UIEdgeInsetsMake(top, 0, bottom, 0);
    
    vc.tableView.scrollIndicatorInsets=vc.tableView.contentInset;
    
    [scrollView addSubview:vc.view];
    
}
#pragma mark ---动画减速时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //NSLog(@">>>>%f",scrollView.contentOffset.x);
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    //获得当前的索引 .当滑动view 的时候，按钮标签页跟着滚动
    NSInteger index=scrollView.contentOffset.x/scrollView.width;
   //  NSLog(@"---%ld",(long)index);
    //点击按钮
    [self ButtonOnClick:self.titleView.subviews[index]];
}
@end
