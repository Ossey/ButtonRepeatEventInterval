//
//  ViewController.m
//  ButtonRepeatEventInterval
//
//  Created by Ossey on 2017/4/23.
//  Copyright © 2017年 Ossey. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+RepeatEventInterval.h"

@interface ViewController () {
    UIButton *btn;
    BOOL isTouchBegin;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isTouchBegin = YES;
    static int i = 0;
    btn = [UIButton buttonWithClickBlock:^(UIButton *btn) {
        NSLog(@"%d", i++);
    }];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(180, 300, 100, 38);
    btn.backgroundColor = [UIColor greenColor];
    btn.layer.cornerRadius = 8;
    [btn.layer setMasksToBounds:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!isTouchBegin) {
        btn.repeatEventInterval = 5;
    } else {
        btn.repeatEventInterval = 0;
    }
    isTouchBegin = !isTouchBegin;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
