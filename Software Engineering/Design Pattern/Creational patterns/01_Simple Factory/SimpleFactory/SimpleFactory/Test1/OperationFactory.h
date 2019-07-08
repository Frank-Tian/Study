//
//  OperationFactory.h
//  SimpleFactory
//
//  Created by zhenzi on 2019/7/8.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

/**
 运算符协议（接口）
 */
@protocol Operation <NSObject>

// 运算数1
@property (nonatomic, strong) NSNumber *number1;
// 运算数2
@property (nonatomic, strong) NSNumber *number2;

@optional
// 获取运算结果
- (NSNumber *)getResult;

@end

// + 运算
@interface OperationAdd : NSObject <Operation>

@end

// - 运算
@interface OperationSub : NSObject <Operation>

@end

// X 运算
@interface OperationMul : NSObject <Operation>

@end

// / 运算
@interface OperationDiv : NSObject <Operation>

@end

/**
 运算工厂
 */
@interface OperationFactory : NSObject

+ (id<Operation>)createOperation:(NSString *)opt;

@end

NS_ASSUME_NONNULL_END
