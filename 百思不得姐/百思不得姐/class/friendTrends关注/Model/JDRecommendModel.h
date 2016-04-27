//
//  JDRecommendModel.h
//  百思不得姐
//
//  Created by helangxin on 16/4/25.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JDRecommendModel : NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger count;
/**名字  */
@property (nonatomic, copy) NSString *name;

/** 模型总数组 */
@property (nonatomic, strong)NSMutableArray *users;



@end
