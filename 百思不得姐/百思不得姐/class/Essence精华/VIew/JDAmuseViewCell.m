//
//  JDAmuseViewCell.m
//  百思不得姐
//
//  Created by helangxin on 16/4/29.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDAmuseViewCell.h"
#import <UIImageView+WebCache.h>


@interface JDAmuseViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *timeView;
@property (weak, nonatomic) IBOutlet UIButton *dingView;
@property (weak, nonatomic) IBOutlet UIButton *caiView;
@property (weak, nonatomic) IBOutlet UIButton *shareView;
@property (weak, nonatomic) IBOutlet UIButton *commentView;
/**
 * 文本内容
 */
@property (weak, nonatomic) IBOutlet UILabel *textView;


@end

@implementation JDAmuseViewCell

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
    frame.size.height-=10;
    frame.origin.y+=10;
    [super setFrame:frame];
   
}
@end
