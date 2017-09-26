# pushValueToViewController
show how push value to viewController
主要描述了属性传值、代理传值、block传值、通知传值等简单的用法
属性传值主要代码：
//属性传值AVC传给BVC，在B的.h文件声明属性
@property (nonatomic, copy) NSString *pushTitle;
在AVC中的跳转：
BViewController *BVC = [[BViewController alloc] init];
BVC.pushTitle = @"A传给B";
[self.navigationController pushViewController:BVC animated:YES];

代理传值，将BVC的值传给AVC
在BVC的.h文件中声明代理
@protocol BViewControllerDelegate <NSObject>

- (void)BVCPushvalueToAVCWithString:(NSString*)value;

@end
//记住使用weak修饰
@property (nonatomic, weak) id<BViewControllerDelegate>delegate;

然后在AVC中声明遵循代理
@interface ViewController ()<BViewControllerDelegate>

@end

在AVC跳转BVC的时候，设置代理为它自己
BVC.delegate = self;

其他的在代码里面都有详细的说明。
