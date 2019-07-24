//
//  ShaoBing.h
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ShaoBingBuilder;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ShaoBingBuilderBlock)(id<ShaoBingBuilder> builder);
@protocol ShaoBingBuilder <NSObject>

- (void)setSize:(CGFloat)size;
- (void)setWeight:(CGFloat)weight;

@end


@interface ShaoBing : NSObject

@property (nonatomic, assign, readonly) CGFloat size;
@property (nonatomic, assign, readonly) CGFloat weight;

+ (instancetype)build:(ShaoBingBuilderBlock)builder;

@end

NS_ASSUME_NONNULL_END
