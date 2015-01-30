//
//  ChineseIndex.h
//  ChineseIndex
//
//  Created by 何瑾 on 14-5-28.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChineseIndex : NSObject

//将汉字数组按照26个英文字母分组
+ (NSDictionary *)groupedChineseCharacter:(NSArray *)array;


@end
