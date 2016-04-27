//
//  JDUserModel.h
//  百思不得姐
//
//  Created by helangxin on 16/4/26.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDUserModel : NSObject

/** 名字 */
@property (nonatomic, copy) NSString *name;
/** 粉丝数 */
@property (nonatomic, copy)NSString* fans_count;
/** 链接 */
@property (nonatomic, copy) NSString *header;

@end
