//
//  MGFileManager.h
//  MGThink
//
//  Created by Maseventeen on 16/4/28.
//  Copyright © 2016年 Margin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGFileManager : NSFileManager

+ (instancetype)shareInstance;

- (NSUInteger)getDirectoryContentSize:(NSString *)path;
- (void)cleanDirectoryContent:(NSString *)path;

@end
