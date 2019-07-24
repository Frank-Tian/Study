//
//  MacBook.m
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "MacBook.h"

@implementation MacBookBuilder
@synthesize color;
@synthesize identifier;
@synthesize size;
@synthesize price;

- (MacBook *)build
{
    MacBook *mb = [[MacBook alloc] init];
    mb.size = self.size;
    mb.color = self.color;
    mb.price = self.price;
    mb.identifier = self.identifier;
    
    return mb;
}

- (MacBook *)build1
{
    return [[MacBook alloc] initWithBuilder:self];
}

@end

@implementation MacBook

- (instancetype)initWithBuilder:(id<MacBookBuilder>)builder
{
    self = [super init];
    if (self) {
        self.size = builder.size;
        self.price = builder.price;
        self.identifier = builder.identifier;
        self.color = builder.color;
    }
    return self;
}

+ (instancetype)build:(MacBookBuilderBlock)builderBlock
{
    MacBookBuilder *builder = [[MacBookBuilder alloc] init];
    if (builderBlock) {
        builderBlock(builder);
    }
    return [builder build];
}

@end
