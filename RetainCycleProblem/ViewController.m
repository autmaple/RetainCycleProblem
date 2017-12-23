//
//  ViewController.m
//  循环引用问题
//
//  Created by lucky on 2017/12/22.
//  Copyright © 2017年 lucky. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 100, 100, 30)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)sender {
    TestViewController* testVc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testVc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
