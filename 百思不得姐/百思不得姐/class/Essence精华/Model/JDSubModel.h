//
//  JDSubModel.h
//  百思不得姐
//
//  Created by helangxin on 16/4/26.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDSubModel : NSObject
//image_list : http://img.spriteapp.cn/ugc/2014/12/08/194139_69654.png,
//theme_id : 64,
//theme_name : 糗事,
//is_sub : 0,
//is_default : 0,
//sub_number : 114291
/** 名字 */
@property (nonatomic, copy) NSString *theme_name ;
/** 图片 */
@property (nonatomic, copy) NSString *image_list;
/** 订阅人数 */
@property (nonatomic, assign) NSInteger sub_number;
@end
