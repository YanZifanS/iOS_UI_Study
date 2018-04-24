//
//  ZFTabBarController.m
//  ZFNews
//
//  Created by yanzifan-mini on 2018/4/23.
//  Copyright © 2018年 yanzifan-mini. All rights reserved.
//

#import "ZFTabBarController.h"
#import "ZFHomeViewController.h"
#import "ZFVideoViewController.h"
#import "ZFNavigationController.h"

@interface ZFTabBarController ()

@end

@implementation ZFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}


- (void)addChildViewControllers {
    
    ZFHomeViewController *networkVC = [[ZFHomeViewController alloc]init];
    [self addChildViewController:networkVC WithTitle:@"首页" image:@"network"];
    
    ZFVideoViewController *wifiBltVC = [[ZFVideoViewController alloc]init];
    [self addChildViewController:wifiBltVC WithTitle:@"WiFi蓝牙" image:@"wifi"];
    
    ZFHomeViewController *codeVC = [[ZFHomeViewController alloc]init];
    [self addChildViewController:codeVC WithTitle:@"编码配置" image:@"code"];
    
    ZFVideoViewController *diskVC = [[ZFVideoViewController alloc]init];
    [self addChildViewController:diskVC WithTitle:@"磁盘管理" image:@"disk"];
}


- (void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title image:(NSString *)imageName {
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.title = title;
    ZFNavigationController *nav = [[ZFNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}







@end
