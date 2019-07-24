//
//  MacBook.h
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MacBookBuilder;
@class MacBook;

NS_ASSUME_NONNULL_BEGIN

typedef void(^MacBookBuilderBlock)(id<MacBookBuilder> builder);


@protocol MacBookBuilder <NSObject>

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) CGFloat price;

@required
- (MacBook *)build;
- (MacBook *)build1;

@end


@interface MacBookBuilder : NSObject <MacBookBuilder>

@end


@interface MacBook : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) CGFloat price;

+ (instancetype)build:(MacBookBuilderBlock)builderBlock;

- (instancetype)initWithBuilder:(id<MacBookBuilder>)builder;

@end

NS_ASSUME_NONNULL_END
