//
//  BViewController.m
//  pushValueDemo
//
//  Created by 烟雨云渊 on 2017/8/26.
//  Copyright © 2017年 YW. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _pushTitle;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToAVC)];
    NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:@"singleKey"];
    NSLog(@"singleValue = %@",value);
}

- (void)backToAVC{
//    block传值
    self.block(@"这是B");
//    代理传值
    [self.delegate BVCPushvalueToAVCWithString:@"这是B的代理传值"];
//    发通知，通知传值
    [[NSNotificationCenter defaultCenter] postNotificationName:@"通知传值" object:@"这是通知"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
