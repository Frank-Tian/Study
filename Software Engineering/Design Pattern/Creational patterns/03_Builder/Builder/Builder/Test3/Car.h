//
//  Car.h
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CarBuilder;
@class Car;

NS_ASSUME_NONNULL_BEGIN
typedef id<CarBuilder> _Nullable(^CarBuilderBlock)(void);

@protocol CarBuilder <NSObject>

- (void)buildBody;
- (void)buildWheel;
- (void)buildEngine;
- (void)buildGearBox;

- (Car *)build;

@end


@interface Car : NSObject

/** name */
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

@interface BaoMaCarBuilder : NSObject <CarBuilder>

@end

@interface BaoJunCarBuilder : NSObject <CarBuilder>

@end

@interface CarDirector : NSObject

- (instancetype)initWithCarBuilder:(id<CarBuilder>)carBuilder;
- (Car *)buildCar;

+ (Car *)buildCarWithBuilder:(CarBuilderBlock)carBuilderBlock;

@end

NS_ASSUME_NONNULL_END
