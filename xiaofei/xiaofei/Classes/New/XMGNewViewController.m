//
//  XMGNewViewController.m
//  xiaofei
//
//  Created by 刘腾飞 on 2017/8/26.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "XMGNewViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGSubTagController.h"

@interface XMGNewViewController ()

@end

@implementation XMGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    [self setupnav];
    // Do any additional setup after loading the view.
}
-(void)setupnav{
    self.navigationItem.title=@"新帖1";
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(tolist) forControlEvents:UIControlEventTouchUpInside];
    UIView *btnview=[[UIView alloc]initWithFrame:btn.bounds];
    [btnview addSubview:btn];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tolist)];
}
-(void)tolist{
    XMGSubTagController *subTag=[[XMGSubTagController alloc]init];
    [self.navigationController pushViewController:subTag animated:YES];
}

@end
