//
//  ViewController.m
//  NotificationDemo
//
//  Created by Frank.Tian on 2019/9/1.
//  Copyright © 2019 Frank. All rights reserved.
//

#import "ViewController.h"

static NSString *kNotificationName = @"name";
static NSString *kNotificationName1 = @"name1";

@interface ViewController ()

@end

/*
 
 通知总结：
 
 1、不管通知的注册是否是主线程，通知触发的代码执行线程由 发出通知的代码所在线程决定。
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:kNotificationName object:nil];
    });
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:kNotificationName1 object:nil];
    
    // Method 2
    [[NSNotificationCenter defaultCenter] addObserverForName:kNotificationName1 object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"----- main queue %@", [NSThread currentThread]);
    }];
}

- (void)action:(NSNotification *)notice
{
    NSLog(@"----name:%@------ %@",notice.name, [NSThread currentThread]);
    
    // Method 1
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"----- dispatch_async main queue %@", [NSThread currentThread]);
    });
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationName object:nil];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationName1 object:nil];
    });
}
@end
