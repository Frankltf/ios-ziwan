//
//  XMGNavigationController.m
//  xiaofei
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "XMGNavigationController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XMGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    id target=self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate=self;
    [self.view addGestureRecognizer:pan];
    self.navigationController.interactivePopGestureRecognizer.enabled=NO;
    // Do any additional setup after loading the view.
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    NSLog(@"%ld",self.childViewControllers.count);
    return self.childViewControllers.count>1;
}
//重写push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"%ld",self.childViewControllers.count);
    
    if(self.childViewControllers.count>0){
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageToBack:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
        
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back{
    [self popViewControllerAnimated:YES];
}
@end
