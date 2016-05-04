//
//  JDAmuseModel.m
//  百思不得姐
//
//  Created by helangxin on 16/4/29.
//  Copyright © 2016年 helangxin. All rights reserved.
//

#import "JDAmuseModel.h"
#import "NSDate+XMGExtension.h"
#import <MJExtension.h>

@implementation JDAmuseModel

{
    CGFloat _cellHight;
    CGRect  _pictureF;
}
/** mj的方法交换把本类的属性进行替换 */
+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"small_iamge":@"image0",
               @"larger_iamge":@"image1",
               @"middle_iamge":@"image2",
             
             };
}


- (NSString *)create_time
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子的创建时间
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else
            { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (create.isYesterday)
        { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
        return _create_time;
    }
}

-(CGFloat)cellHight
{
    if (!_cellHight)
    {
        // 文字的最大尺寸
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 4 * JDTopicCellMargin, MAXFLOAT);
        //    CGFloat textH = [topic.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maxSize].height;
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        
        // cell的高度
       _cellHight = JDTopicTextY + textH + JDTopicTarBarBottomH + 2 * JDTopicCellMargin;
        /** cell的高度=文本内容的高度+文字内容的高度+tarbar底部的高度+2倍的间距 */
        
        //计算picture的frame
        if (self.type==JDTopicTypePicture)
        {
            CGFloat pictureW=maxSize.width;
            CGFloat pictureH=pictureW*self.height/self.width;
            if (pictureH>=JDTopicPictureMaxH)
            {
                /** 如果超出最大的size则用大图 */
                pictureH=JDTopicPictureBreakH;
                self.bigPicture=YES;
            }
            
            CGFloat pictureX=JDTopicCellMargin;
            CGFloat pictureY=JDTopicTextY+JDTopicCellMargin;
            _pictureF=CGRectMake(pictureX, pictureY, pictureW, pictureH);
            _cellHight=_cellHight+ pictureH;
        }
        
    }
    return _cellHight;
}
@end
