//
//  Car.m
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

@end

@implementation BaoMaCarBuilder

- (Car *)build
{
    return [[Car alloc] initWithName:@"BaoMa"];
}

@end

@implementation BaoJunCarBuilder

- (Car *)build
{
    return [[Car alloc] initWithName:@"BaoJun"];
}

@end

@implementation CarDirector

- (Car *)buildCar
{
    Car *car = [[Car alloc] init];
    return car;
}

+ (Car *)buildCarWithBuilder:(CarBuilderBlock)carBuilderBlock
{
    Car *car = nil;
    if (carBuilderBlock) {
        id<CarBuilder> builder = carBuilderBlock();
         car = [builder build];
    }
    return car;
}
@end
