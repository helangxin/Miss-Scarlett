//
//  JDBaseTableViewController.h
//  百思不得姐
//
//  Created by helangxin on 16/5/2.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    JDTopicTypeAll = 1,
    JDTopicTypePicture = 10,
    JDTopicTypeWord = 29,
    JDGTopicTypeVoice = 31,
    JDTopicTypeVideo = 41
} JDTopicType;

@interface JDBaseTableViewController : UITableViewController
/** 下一页参数 */
@property (nonatomic, copy) NSString *maxtime;

/** 当前页数 */
@property (nonatomic, assign) NSInteger page;

/** 控制器的类型 */
@property (nonatomic, assign) JDTopicType type;

@end
