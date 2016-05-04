//
//  JDConstValue.h
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

//精华cell的间距
UIKIT_EXTERN CGFloat const JDTopicCellMargin;

//精华cell文本内容的Y
UIKIT_EXTERN CGFloat const JDTopicTextY;

//精华cell的工具条的高度
UIKIT_EXTERN CGFloat const JDTopicTarBarBottomH;

/** 精华cell的图片 最大高度 */
UIKIT_EXTERN CGFloat const JDTopicPictureMaxH;

/** 精华cell的图片 最大高度超过了就用这个 */
UIKIT_EXTERN CGFloat const JDTopicPictureBreakH;
