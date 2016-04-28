//
//  MGFileManager.m
//  MGThink
//
//  Created by Maseventeen on 16/4/28.
//  Copyright © 2016年 Margin. All rights reserved.
//

#import "MGFileManager.h"

@implementation MGFileManager
static id _instance;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super alloc] init];
    });
    return _instance;
}
- (NSUInteger)getDirectoryContentSize:(NSString *)path {
    NSUInteger contentSize = 0;
    NSDirectoryEnumerator *emtor = [[MGFileManager shareInstance] enumeratorAtPath:path];
    for (NSString *subPath in emtor) {
        NSString *fullPath = [path stringByAppendingPathComponent:subPath];
        NSDictionary *fileAttr = [[MGFileManager shareInstance] attributesOfItemAtPath:fullPath error:nil];
        contentSize += [fileAttr[NSFileSize] integerValue];
        contentSize += fileAttr.fileSize;
    }
    return contentSize;
}

- (void)cleanDirectoryContent:(NSString *)path {
    NSArray *subpaths = [[MGFileManager shareInstance] subpathsAtPath:path];
    for (NSString *content in subpaths) {
        NSString *fullContent = [path stringByAppendingPathComponent:content];
        NSDictionary *contentAttr = [[MGFileManager shareInstance] attributesOfItemAtPath:fullContent error:nil];
        if ([contentAttr.fileType isEqualToString:NSFileTypeDirectory]) continue;
        [[MGFileManager shareInstance] removeItemAtPath:fullContent error:nil];
    }
}

@end
