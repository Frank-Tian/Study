//
//  Dialog.h
//  SimpleFactory
//
//  Created by zhenzi on 2019/7/8.
//  Copyright © 2019 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Button <NSObject>

@optional
- (void)render;
- (void)onClick;

@end


@interface HtmlButton : NSObject <Button>

@end

@interface UIButton : NSObject <Button>

@end


@protocol Dialog <NSObject>

@optional
- (id<Button>)createBtn;
- (void)renderWindow;
@end

@interface HtmlDialog : NSObject <Dialog>

@end

@interface UIDialog : NSObject <Dialog>

@end


NS_ASSUME_NONNULL_END
