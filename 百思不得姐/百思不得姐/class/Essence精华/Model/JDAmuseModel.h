//
//  JDAmuseModel.h
//  百思不得姐
//
//  Created by helangxin on 16/4/29.
//  Copyright © 2016年 helangxin. All rights reserved.
//
/*

*/
#import <Foundation/Foundation.h>

@interface JDAmuseModel : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 发帖时间 */
@property (nonatomic, copy) NSString *create_time;
/** 文字内容 */
@property (nonatomic, copy) NSString *text;
/** 顶的数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩的数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发的数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论的数量 */
@property (nonatomic, assign) NSInteger comment;

/** 帖子的类型 */
@property (nonatomic, assign) JDTopicType type;

/** 页面中图片的URL */
@property (nonatomic, copy) NSString *image0;
/** 小图 */
@property (nonatomic, copy) NSString *small_iamge;
/** 中图 */
@property (nonatomic, copy) NSString *middle_iamge;
/** 大图 */
@property (nonatomic, copy) NSString *larger_iamge;

/** 图片的高度 */
@property (nonatomic, assign) CGFloat height;

/** 图片的宽度 */
@property (nonatomic, assign) CGFloat width;






/*-------------<##>-----------------*/
/** 行高 */

@property (nonatomic, assign,readonly) CGFloat cellHight;
/** 大图的属性 */
@property (nonatomic, assign ,getter=isBigPicture) BOOL bigPicture;

/** 图片控件的frame */
@property (nonatomic, assign,readonly) CGRect pictureF;

@end
