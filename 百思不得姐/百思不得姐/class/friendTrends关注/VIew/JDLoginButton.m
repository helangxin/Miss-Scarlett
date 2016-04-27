//
//  JDLoginButton.m
//  百思不得姐
//
//  Created by helangxin on 16/4/27.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDLoginButton.h"

@implementation JDLoginButton

-(void)setup
{
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        [self setup ];
    }
    return self;
    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

//如果要设置button 的图片和文字要呈现自定义样式，要重写layoutSubviews方法
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置image
    self.imageView.x=0;
    self.imageView.y=0;
    self.imageView.width=self.width;
    self.imageView.height=self.width;
    //设置lable
    
    self.titleLabel.x=0;
    self.titleLabel.y=self.imageView.height;
    self.titleLabel.width=self.width;
    self.titleLabel.height=self.height-self.titleLabel.y;
}

@end
