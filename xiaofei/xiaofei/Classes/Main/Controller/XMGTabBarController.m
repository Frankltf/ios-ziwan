//
//  XMGTabBarController.m
//  xiaofei
//
//  Created by 刘腾飞 on 2017/8/26.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "XMGTabBarController.h"
#import "XMGEssenceViewController.h"
#import "XMGNewViewController.h"
#import "XMGPublishViewController.h"
#import "XMGFriendTrendViewController.h"
#import "XMGMeTableViewController.h"
#import "XMGNavigationController.h"

@interface XMGTabBarController ()

@end

@implementation XMGTabBarController

+(void)load{
    NSMutableDictionary *attr3=[NSMutableDictionary dictionary];
    attr3[NSForegroundColorAttributeName]=[UIColor blackColor];
    attr3[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [[UITabBarItem appearance]setTitleTextAttributes:attr3 forState:UIControlStateNormal];
    
    NSMutableDictionary *attr4=[NSMutableDictionary dictionary];
    attr4[NSForegroundColorAttributeName]=[UIColor redColor];
    attr4[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [[UITabBarItem appearance]setTitleTextAttributes:attr4 forState:UIControlStateSelected];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildController];
}
//设置tabbar字体样式
-(void)setupTabbarTitle{
    NSMutableDictionary *attr3=[NSMutableDictionary dictionary];
    attr3[NSForegroundColorAttributeName]=[UIColor blackColor];
    attr3[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [[UITabBarItem appearance]setTitleTextAttributes:attr3 forState:UIControlStateNormal];
    
    NSMutableDictionary *attr4=[NSMutableDictionary dictionary];
    attr4[NSForegroundColorAttributeName]=[UIColor redColor];
    attr4[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [[UITabBarItem appearance]setTitleTextAttributes:attr4 forState:UIControlStateSelected];
}
//设置根目录控制器
-(void)setupChildController{
    XMGEssenceViewController *essence=[[XMGEssenceViewController alloc]init];
    XMGNavigationController *navEssence=[[XMGNavigationController alloc]initWithRootViewController:essence];
    navEssence.tabBarItem.title=@"精华";
    navEssence.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    navEssence.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabBar_essence_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self addChildViewController:navEssence];
    
    XMGNewViewController *new=[[XMGNewViewController alloc]init];
    XMGNavigationController *navNew=[[XMGNavigationController alloc]initWithRootViewController:new];
    navNew.tabBarItem.title=@"新帖";
    navNew.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    navNew.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabBar_new_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navNew];
    
    XMGPublishViewController *publish=[[XMGPublishViewController alloc]init];
    XMGNavigationController *navPublish=[[XMGNavigationController alloc]initWithRootViewController:publish];
    navPublish.tabBarItem.title=@"发布";
    
    [self addChildViewController:navPublish];
    
    XMGFriendTrendViewController *friendTrend=[[XMGFriendTrendViewController alloc]init];
    XMGNavigationController *navfriend=[[XMGNavigationController alloc]initWithRootViewController:friendTrend];
    navfriend.tabBarItem.title=@"关注";
     navfriend.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    navfriend.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navfriend];
    
    XMGMeTableViewController *me=[[XMGMeTableViewController alloc]init];
    XMGNavigationController *navMe=[[XMGNavigationController alloc]initWithRootViewController:me];
    navMe.tabBarItem.title=@"我的";
    navMe.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    navMe.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabBar_me_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navMe];
}

@end
