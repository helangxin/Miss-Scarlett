//
//  JDProgressView.m
//  百思不得姐
//
//  Created by helangxin on 5/4/16.
//  Copyright © 2016 helangxin. All rights reserved.
//

#import "JDProgressView.h"

@implementation JDProgressView

-(void)awakeFromNib
{
    self.roundedCorners=2;
    self.progressLabel.textColor = [UIColor whiteColor];
}
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [super setProgress:progress animated:animated];
    
    NSString *text = [NSString stringWithFormat:@"%.0f%%", progress * 100];
    self.progressLabel.text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

@end
