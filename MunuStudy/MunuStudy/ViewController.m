//
//  ViewController.m
//  MunuStudy
//
//  Created by 彦子凡 on 2018/4/19.
//  Copyright © 2018年 彦子凡. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//UIMenuController 菜单的使用
//应用场景有 支付宝，QQ右侧加号按钮的弹窗

/*
 * UITextField UITextView UIWebView 自带
 
 */

- (IBAction)clickShowMenu:(id)sender {
    NSLog(@"显示Menu");
    [self.testBtn becomeFirstResponder];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    UIMenuItem *menuItem_1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(click)];//@selector()括号中为该按钮触发的方法，该方法必须在UIVIewContrller中进行声明，就是投向的view所绑定的viewController类中必须实现这个方法
    UIMenuItem *menuItem_2 = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(click)];
    UIMenuItem *menuItem_3 = [[UIMenuItem alloc] initWithTitle:@"移动" action:@selector(click)];
    
    menuController.menuItems = [NSArray arrayWithObjects: menuItem_1, menuItem_2,menuItem_3,nil];
    [menuController setTargetRect:CGRectMake(100.0, 100.0, 50, 50) inView:self.view];//touchpos_x, touchpos_y分别为长按那点的x和y坐标   self.view为将要展示弹出框的视图
    [menuController setMenuVisible:YES animated:YES];
}

//一定要添加此代码 默认为NO
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)click {
    NSLog(@"11111");
}

@end
