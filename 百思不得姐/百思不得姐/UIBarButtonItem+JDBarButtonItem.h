//
//  UIBarButtonItem+JDBarButtonItem.h
//  百思不得姐
//
//  Created by helangxin on 16/4/24.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JDBarButtonItem)
+(instancetype)itemImage:(NSString*)image HighImage:(NSString*)highImage target:(id)target action:(SEL)action;
@end
