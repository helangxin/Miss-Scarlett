//
//  JDUserTableViewCell.m
//  百思不得姐
//
//  Created by helangxin on 16/4/26.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDUserTableViewCell.h"
#import "JDUserModel.h"
#import <UIImageView+WebCache.h>

@interface JDUserTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *fansCountView;

@end

@implementation JDUserTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUserModel:(JDUserModel *)userModel
{
    _userModel=userModel;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:userModel.header]placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameView.text=userModel.name;
//    NSString *str =[NSString stringWithFormat:@"%d",userModel.fans_count/10000];
    self.fansCountView.text=[NSString stringWithFormat:@"%@万人关注",(userModel.fans_count)];
}
@end
