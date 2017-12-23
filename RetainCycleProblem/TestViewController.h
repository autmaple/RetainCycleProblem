//
//  TestViewController.h
//  循环引用问题
//
//  Created by lucky on 2017/12/22.
//  Copyright © 2017年 lucky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController

@property (nonatomic, copy) void(^callBack)(NSString* name);

@end
