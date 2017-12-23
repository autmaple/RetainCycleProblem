//
//  TestViewController.m
//  循环引用问题
//
//  Created by lucky on 2017/12/22.
//  Copyright © 2017年 lucky. All rights reserved.
//

#import "TestViewController.h"
#import <objc/runtime.h>

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    __weak typeof(self) weakSelf = self;
    [self setCallBack:^(NSString *name) {
        NSLog(@"strong之前:%lu", CFGetRetainCount((__bridge CFTypeRef)(((NSObject *)weakSelf))));
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"strong之后:%lu", CFGetRetainCount((__bridge CFTypeRef)(((NSObject *)weakSelf))));
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:5];
            NSLog(@"%@ %@", strongSelf, name);
        });
    }];
    self.callBack(@"come on");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    NSLog(@"%@ dealloc ", self);
}

@end
