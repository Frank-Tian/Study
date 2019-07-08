//
//  main.m
//  SimpleFactory
//
//  Created by zhenzi on 2019/7/8.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperationFactory.h"
#import "Dialog.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        id<Operation> add = [OperationFactory createOperation:@"+"];
        id<Operation> sub = [OperationFactory createOperation:@"-"];
        id<Operation> mul = [OperationFactory createOperation:@"*"];
        id<Operation> div = [OperationFactory createOperation:@"/"];
        
        // add
        add.number1 = @(1);
        add.number2 = @(3);
        NSLog(@"%@", [add getResult]);
        
        // sub
        sub.number1 = @(5);
        sub.number2 = @(3);
        NSLog(@"%@",[sub getResult]);
        
        // mul
        mul.number1 = @(5);
        mul.number2 = @(6);
        NSLog(@"%@",[mul getResult]);
        
        // div
        div.number1 = @(8);
        div.number2 = @(2);
        NSLog(@"%@",[div getResult]);
        
        
        
        // --
        id<Dialog> dialog = nil;
        NSString *env = @"iOS";
        if ([env isEqualToString:@"iOS"]) {
            dialog = [UIDialog new];
        } else {
            dialog = [HtmlDialog new];
        }
        [dialog renderWindow];
        
    }
    return 0;
}
