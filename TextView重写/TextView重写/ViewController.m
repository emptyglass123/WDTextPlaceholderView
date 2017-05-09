//
//  ViewController.m
//  TextView重写
//
//  Created by 朱辉 on 2017/5/9.
//  Copyright © 2017年 WD. All rights reserved.
//

#import "ViewController.h"
#import "WDTextPlaceholderView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.view.backgroundColor = [UIColor grayColor];
    
    WDTextPlaceholderView *text = [[WDTextPlaceholderView alloc] initWithFrame:CGRectMake(20, 120, 300, 200)];
    [self.view addSubview:text];
    text.backgroundColor = [UIColor whiteColor];
    text.placeholder = @"请输入...";
    text.placeholderColor = [UIColor lightGrayColor];
    text.indentOfY = 7.0;        // 垂直缩进
    text.indentOfX = 7.0;       // 水平缩进
    text.openPlaceHolder = YES; // 打开水印 默认 YES
    text.openRoundView = YES;   // 打开圆角 默认 NO
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
