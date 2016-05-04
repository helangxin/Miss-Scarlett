//
//  JDPictureVIew.h
//  百思不得姐
//
//  Created by helangxin on 5/3/16.
//  Copyright © 2016 helangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDAmuseModel.h"

@interface JDPictureVIew : UIView
/** 模型数据 */
@property (nonatomic, strong) JDAmuseModel *model;

+(instancetype)pictureView;
@end
