//
//  ViewController.m
//  pushValueDemo
//
//  Created by 烟雨云渊 on 2017/8/26.
//  Copyright © 2017年 YW. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()<BViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    测试一下提交到github
    self.title = @"第一个界面的title";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(pushToBVC)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTheValueFromBVC:) name:@"通知传值" object:nil];
    [[NSUserDefaults standardUserDefaults] setObject:@"这是单例" forKey:@"singleKey"];
}

- (void)pushToBVC{
    BViewController *BVC = [[BViewController alloc] init];
    //    属性传值
    BVC.pushTitle = @"A传给B";
    //    block传值
    //    常用于回调
    BVC.block = ^(NSString *Btitle) {
//        这里可以执行一些在BVC触发了block之后要做的事情，相当于通知的响应方法
        NSLog(@"Btitle = %@",Btitle);
    };
//    让A成为B的代理
//    代理传值和block传值相似，都是将事件分发出去。但是与block的不同在于，代理具有松耦合性，谁想处理事件成为代理即可。
    BVC.delegate = self;
    [self.navigationController pushViewController:BVC animated:YES];
}

- (void)BVCPushvalueToAVCWithString:(NSString *)value{
    NSLog(@"value = %@",value);
}

- (void)addTheValueFromBVC:(NSNotification*)noti{
    NSLog(@"notiValue = %@",noti.object);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
