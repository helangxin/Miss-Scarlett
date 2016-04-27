//
//  JDTextField.m
//  百思不得姐
//
//  Created by helangxin on 16/4/27.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDTextField.h"
#import <objc/runtime.h>

@implementation JDTextField

/**修改占位符的字体颜色大小
 *  1.用属性修改
 *  2.用方法修改
    3.用运行时访问属性，用KVC赋值
 */
//-(void)drawPlaceholderInRect:(CGRect)rect
//{
//    [self.placeholder drawInRect:CGRectMake(0, 0, 100, 25) withAttributes:@{
//                                                                            NSFontAttributeName:[UIFont systemFontOfSize:18]                                           }];
//}
//
//+(void)initialize
//{
//    [self getIvars];
//}
//+ (void)getIvars
//{
//    unsigned int count = 0;
//    
//    // 拷贝出所有的成员变量列表
//    Ivar *ivars = class_copyIvarList([UITextField class], &count);
//    
//    for (int i = 0; i<count; i++) {
//        // 取出成员变量
//        //        Ivar ivar = *(ivars + i);
//        Ivar ivar = ivars[i];
//        
//        // 打印成员变量名字
//        NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
//    }
//    
//    // 释放
//    free(ivars);
//}


//修改占位符的颜色
//-(void)awakeFromNib
//{
//    [super awakeFromNib];
//    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
//}

@end
