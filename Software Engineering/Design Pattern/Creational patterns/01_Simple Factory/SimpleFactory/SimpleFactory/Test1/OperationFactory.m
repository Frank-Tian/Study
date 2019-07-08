//
//  OperationFactory.m
//  SimpleFactory
//
//  Created by zhenzi on 2019/7/8.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "OperationFactory.h"

@implementation OperationAdd
@synthesize number1;
@synthesize number2;

- (NSNumber *)getResult
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithDecimal:number1.decimalValue];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    return [num1 decimalNumberByAdding:num2];
}
@end

@implementation OperationSub
@synthesize number1;
@synthesize number2;

- (NSNumber *)getResult
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithDecimal:number1.decimalValue];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    return [num1 decimalNumberBySubtracting:num2];
}
@end

@implementation OperationMul
@synthesize number1;
@synthesize number2;

- (NSNumber *)getResult
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithDecimal:number1.decimalValue];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    return [num1 decimalNumberByMultiplyingBy:num2];
}
@end

@implementation OperationDiv
@synthesize number1;
@synthesize number2;

- (NSNumber *)getResult
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithDecimal:number1.decimalValue];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithDecimal:number2.decimalValue];
    return [num1 decimalNumberByDividingBy:num2];
}
@end

@implementation OperationFactory

+ (id<Operation>)createOperation:(NSString *)opt
{
    id <Operation> oper = nil;
    
    if ([opt isEqualToString:@"+"]) {
        oper = [OperationAdd new];
    } else if ([opt isEqualToString:@"-"]) {
        oper = [OperationSub new];
    } else if ([opt isEqualToString:@"*"]) {
        oper = [OperationMul new];
    } else if ([opt isEqualToString:@"/"]) {
        oper = [OperationDiv new];
    }
    
    return oper;
}

@end
