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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
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
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:userModel.header]placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameView.text=userModel.name;
    self.fansCountView.text=[NSString stringWithFormat:@"%zd万人关注",(int)(userModel.fans_count)/10000];
}
@end
