//
//  ViewController.m
//  HollowoutDemo
//
//  Created by liuwei on 16/9/19.
//  Copyright © 2016年 liuwei. All rights reserved.
//

#import "ViewController.h"
#import "HollowoutView.h"

#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<4; i++) {
        UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(i%2*kScreenWidth/2, i/2*kScreenHeight/2, kScreenWidth/2, kScreenHeight/2)];
        testView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        [self.view addSubview:testView];
    }

    
    HollowoutView *test = [[HollowoutView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)/2-50, CGRectGetWidth(self.view.frame), 100)];
    test.backgroundColor = [UIColor redColor];
    test.text = @"test";
    test.font = [UIFont systemFontOfSize:60];
    test.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:test];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
