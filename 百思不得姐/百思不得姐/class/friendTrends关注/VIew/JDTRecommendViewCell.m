//
//  JDTRecommendViewCell.m
//  百思不得姐
//
//  Created by helangxin on 16/4/25.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDTRecommendViewCell.h"

@interface JDTRecommendViewCell ()
@property (weak, nonatomic) IBOutlet UIView *selectVIew;

@end
@implementation JDTRecommendViewCell

- (void)awakeFromNib
{
    self.backgroundColor=JDColor(244,244,244);
    self.textLabel.textColor=JDColor(78, 78, 78);
   self.selectVIew.backgroundColor= JDColor(219, 21, 26);
//    //self.textLabel.userInteractionEnabled  = YES;
  // self.textLabel.highlightedTextColor=[UIColor redColor];
}

//设置左侧的名称

-(void)setCategory:(JDRecommendModel *)category
{
    _category=category;
    self.textLabel.text=category.name;
}

//-(void)layoutSubviews
//{
//    // 重新调整内部textLabel的frame
//    self.textLabel.y = 2;
//    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
//}
//设置选中状态
-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.selectVIew.hidden =!selected;
    self.textLabel.textColor=selected?self.selectVIew.backgroundColor:JDColor(78, 78, 78);
}

@end
