//
//  JDAmuseViewCell.m
//  百思不得姐
//
//  Created by helangxin on 16/4/29.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDAmuseViewCell.h"
#import <UIImageView+WebCache.h>
#import "JDPictureVIew.h"

@interface JDAmuseViewCell ()
//头像
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//昵称
@property (weak, nonatomic) IBOutlet UILabel *nameView;
//发布时间
@property (weak, nonatomic) IBOutlet UILabel *timeView;
//顶的数量
@property (weak, nonatomic) IBOutlet UIButton *dingView;
//踩的数量
@property (weak, nonatomic) IBOutlet UIButton *caiView;
//分享
@property (weak, nonatomic) IBOutlet UIButton *shareView;

@property (weak, nonatomic) IBOutlet UIButton *commentView;
//文本内容
@property (weak, nonatomic) IBOutlet UILabel *textView;

/** 帖子中间的内容 */
@property (nonatomic, strong) JDPictureVIew *pictureView;

@end

@implementation JDAmuseViewCell

/** picture的懒加载 */
-(JDPictureVIew *)pictureView
{
    if (!_pictureView)
    {
        JDPictureVIew*pictureView=[JDPictureVIew pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView=pictureView;
    }
    return _pictureView;
}

//赋值
-(void)setAmuseModel:(JDAmuseModel *)amuseModel
{
    _amuseModel=amuseModel;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:amuseModel.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameView.text=amuseModel.name;
  
    self.timeView.text=amuseModel.create_time;
    self.dingView.titleLabel.text=[NSString stringWithFormat:@"%ld",(long)amuseModel.ding];
    self.caiView.titleLabel.text=[NSString stringWithFormat:@"%ld",(long)amuseModel.cai];
     self.shareView.titleLabel.text=[NSString stringWithFormat:@"%ld",(long)amuseModel.repost];
     self.commentView.titleLabel.text=[NSString stringWithFormat:@"%ld",(long)amuseModel.comment];
    self.textView.text=amuseModel.text;
    
     /*================ 判断帖子类型分别赋值 =================*/
    if (amuseModel.type==JDTopicTypePicture)
    {
        self.pictureView.model=amuseModel;
        /** 设置图片的frame */
        self.pictureView.frame=amuseModel.pictureF;
    }

}
- (void)awakeFromNib {
    
    [super awakeFromNib];
    UIImageView*imageView=[[UIImageView alloc]init];
    imageView.image=[UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView=imageView;
}

/**
 *  重写cell的frame
 */
-(void)setFrame:(CGRect)frame
{
    frame.origin.x=10;
    frame.size.width-=20;
    frame.size.height-=5;
    frame.origin.y+=10;
    [super setFrame:frame];
}
@end
