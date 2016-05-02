//
//  JDAmuseModel.h
//  百思不得姐
//
//  Created by helangxin on 16/4/29.
//  Copyright © 2016年 helangxin. All rights reserved.
//
/*
 {
	cache_version : 2,
	created_at : 2016-04-29 14:43:01,
	id : 18254334,
	is_gif : 0,
	voicetime : 0,
	image2 : http://wimg.spriteapp.cn/ugc/2016/04/27/571fc42769615.jpg,
	voicelength : 0,
	top_cmt : [
 ],
	repost : 9,
	bimageuri : ,
	image1 : http://wimg.spriteapp.cn/ugc/2016/04/27/571fc42769615.jpg,
	text : 今天捡到的手机，不知道能不能玩炉石？,
	theme_type : 0,
	      hate : 144,
	image0 : http://wimg.spriteapp.cn/ugc/2016/04/27/571fc42769615.jpg,
	comment : 131,
	     passtime : 2016-04-29 14:43:01,
	     ding : 588,
	type : 10,
	tag : ,
	cdn_img : http://wimg.spriteapp.cn/ugc/2016/04/27/571fc42769615.jpg,
	theme_name : ,
	create_time : 2016-04-27 03:40:23,
	favourite : 6,
	themes : [
 ],
	name : 内涵丨甜小橙,
	height : 640,
	status : 4,
	videotime : 0,
	bookmark : 6,
	cai : 144,
	screen_name : 内涵丨甜小橙,
	profile_image : http://wimg.spriteapp.cn/profile/large/2016/04/23/571a9af21ae6c_mini.jpg,
	love : 588,
	user_id : 16551323,
	theme_id : 0,
	original_pid : 0,
	t : 1461912181,
	weixin_url : http://b.f.winapp111.com.cn/share/18254334.html?wx.qq.com&appname=,
	voiceuri : ,
	videouri : ,
	width : 480
 },
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


/** 行高 */

@property (nonatomic, assign,readonly) CGFloat cellHight;



@end
