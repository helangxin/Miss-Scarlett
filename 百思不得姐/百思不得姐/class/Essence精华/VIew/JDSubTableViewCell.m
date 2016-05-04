//
//  JDSubTableViewCell.m
//  百思不得姐
//
//  Created by helangxin on 16/4/26.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDSubTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface JDSubTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *recommendView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *subNumberView;
@property (weak, nonatomic) IBOutlet UIButton *recommendView;

@end

@implementation JDSubTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setSubModel:(JDSubModel *)subModel
{
    _subModel=subModel;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:subModel.image_list]placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameView.text=subModel.theme_name;
    self.subNumberView.text=[NSString stringWithFormat:@"%ld万人订阅",(long)subModel.sub_number/10000];
}

/**
 *  重写cell的frame
 */
-(void)setFrame:(CGRect)frame
{
    frame.origin.x=10;
    frame.size.width-=20;
    frame.size.height-=2;
    [super setFrame:frame];
}
@end
