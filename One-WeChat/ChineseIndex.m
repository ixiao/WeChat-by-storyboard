//
//  ChineseIndex.m
//  ChineseIndex
//
//  Created by 何瑾 on 14-5-28.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import "ChineseIndex.h"
#import "pinyinFirstLetter.h"

@implementation ChineseIndex

//将汉字数组按照26个英文字母分组
+ (NSDictionary *)groupedChineseCharacter:(NSArray *)array {
    //创建可变字典，存放26个字母对应的26个可变数组
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:26];
    for (char c='a'; c<='z'; c++) {
        NSMutableArray *array = [NSMutableArray new];
        [dict setObject:array forKey:[NSString stringWithFormat:@"%c",c]];
    }
    //将数据按照拼音首字母分别放入数组
    for (NSString *chineseCharacter in array) {
        NSString *initial = [NSString stringWithFormat:@"%c",pinyinFirstLetter([chineseCharacter characterAtIndex:0])];
        NSMutableArray *array = [dict objectForKey:initial];
        [array addObject:chineseCharacter];
    }
    //删除空数组
    for (char c='a'; c<='z'; c++) {
        NSString *key = [NSString stringWithFormat:@"%c",c];
        NSMutableArray *array = [dict objectForKey:key];
        if (array.count == 0) {
            [dict removeObjectForKey:key];
        }
    }
    return dict;
}

@end
