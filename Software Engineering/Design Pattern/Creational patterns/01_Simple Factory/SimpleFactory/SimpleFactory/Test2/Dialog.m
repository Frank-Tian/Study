//
//  Dialog.m
//  SimpleFactory
//
//  Created by zhenzi on 2019/7/8.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "Dialog.h"

@implementation HtmlButton

- (void)render
{
    NSLog(@"render Html button");
}

- (void)onClick
{
    NSLog(@"Html button onClick");
}

@end

@implementation UIButton

- (void)render
{
    NSLog(@"render UIButton");
}

- (void)onClick
{
    NSLog(@"UIButton onClick");
}

@end


@implementation HtmlDialog

- (id<Button>)createBtn
{
    return [HtmlButton new];
}

- (void)renderWindow
{
    id<Button> btn = [self createBtn];
    [btn render];
}
@end

@implementation UIDialog

- (id<Button>)createBtn
{
    return [UIButton new];
}

- (void)renderWindow
{
    id<Button> btn = [self createBtn];
    [btn render];
}
@end
