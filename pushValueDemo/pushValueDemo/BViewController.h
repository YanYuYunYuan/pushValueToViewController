//
//  BViewController.h
//  pushValueDemo
//
//  Created by 烟雨云渊 on 2017/8/26.
//  Copyright © 2017年 YW. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BViewControllerDelegate <NSObject>

- (void)BVCPushvalueToAVCWithString:(NSString*)value;

@end

@interface BViewController : UIViewController
//属性传值A传给B
@property (nonatomic, copy) NSString *pushTitle;
//block传值，B传给A
@property (nonatomic, copy) void(^block)(NSString *Btitle);
//代理传值(在MRC中用assign修饰，在ARC中用weak修饰)
@property (nonatomic, weak) id<BViewControllerDelegate>delegate;
@end
