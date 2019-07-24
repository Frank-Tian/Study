//
//  main.m
//  Builder
//
//  Created by Frank.Tian on 2019/7/24.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShaoBing.h"
#import "MacBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        ShaoBing *sb = [ShaoBing build:^(id<ShaoBingBuilder> _Nonnull builder) {
            [builder setSize:100];
            [builder setWeight:200];
        }];
        NSLog(@"sb, size:%.f  weight:%.f", sb.size, sb.weight);
        
        MacBook *mb = [MacBook build:^(id<MacBookBuilder>  _Nonnull builder) {
            builder.identifier = @"Q@W!#SSA";
            builder.color = @"White";
            builder.size = 15;
            builder.price = 11120;
        }];
        
        NSLog(@"macbook, iden:%@, color:%@,  size:%ld,  price:%.f", mb.identifier, mb.color, mb.size,  mb.price);
        
    }
    return 0;
}
