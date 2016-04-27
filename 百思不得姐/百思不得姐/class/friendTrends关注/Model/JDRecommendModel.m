//
//  JDRecommendModel.m
//  百思不得姐
//
//  Created by helangxin on 16/4/25.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDRecommendModel.h"

@implementation JDRecommendModel

-(NSMutableArray *)users
{
    if (_users==nil) {
        _users=[NSMutableArray array];
    }
    return _users;
}

@end
