//
//  ShaoBing.m
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "ShaoBing.h"

@interface ShaoBing ()<ShaoBingBuilder>

@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGFloat weight;

@end

@implementation ShaoBing


+ (instancetype)build:(ShaoBingBuilderBlock)builder
{
    ShaoBing *sb = [ShaoBing new];
    if (builder) {
        builder(sb);
    }
    return sb;
}


@end
