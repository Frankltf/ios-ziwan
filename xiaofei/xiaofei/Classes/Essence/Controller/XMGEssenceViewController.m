//
//  XMGEssenceViewController.m
//  xiaofei
//
//  Created by 刘腾飞 on 2017/8/26.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "XMGAllTableViewController.h"
#import "XMGVedioTableViewController.h"
#import "XMGVoiceTableViewController.h"
#import "XMGPhotoTableViewController.h"
#import "XMGWordTableViewController.h"

@interface XMGEssenceViewController ()
@property (nonatomic,weak)UIView *titleView;
@property (nonatomic,weak)UIButton *previousBtn;
@property (nonatomic,weak)UIScrollView *scrollView;
@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildVc];

    [self setupScrollView];
    
    [self setupTitleView];
}
//初始化子控制器
-(void)setupAllChildVc{
    XMGAllTableViewController *all=[[XMGAllTableViewController alloc]init];
    XMGVedioTableViewController *vedio=[[XMGVedioTableViewController alloc]init];
    XMGVoiceTableViewController *voice=[[XMGVoiceTableViewController alloc]init];
    XMGPhotoTableViewController *photo=[[XMGPhotoTableViewController alloc]init];
    XMGWordTableViewController *word=[[XMGWordTableViewController alloc]init];
    [self addChildViewController:all];
    [self addChildViewController:vedio];
    [self addChildViewController:voice];
    [self addChildViewController:photo];
    [self addChildViewController:word];
    
}
//设置scrollview
-(void)setupScrollView{
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.backgroundColor=[UIColor greenColor];
    scrollView.frame=self.view.bounds;
    self.scrollView=scrollView;
//    scrollView.showsVerticalScrollIndicator=YES;
    scrollView.showsHorizontalScrollIndicator=YES;
    [self.view addSubview:scrollView];
    
    NSUInteger count=self.childViewControllers.count;
    CGFloat scrollviewW=scrollView.frame.size.width;
    scrollView.contentSize=CGSizeMake(count*scrollviewW, 0);
}
//设置导航栏
-(void)setupTitleView{
    UIView *titleView=[[UIView alloc]init];
    self.titleView=titleView;
    titleView.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.5];
    titleView.frame=CGRectMake(0, 64, self.view.bounds.size.width, 35);
    [self.view addSubview:titleView];
    [self setupTitleButtons];
}
//设置导航栏按钮
-(void)setupTitleButtons{
    NSArray *arr=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSUInteger count=arr.count;
    CGFloat titleButtonw=self.view.bounds.size.width/count;
    CGFloat titleButtonH=self.titleView.bounds.size.height;
    for (NSUInteger i=0; i<count; i++) {
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        if(i==0){
            btn.selected=YES;
            self.previousBtn=btn;
        }
        btn.tag=1+99;
        [self.titleView addSubview:btn];
        btn.frame=CGRectMake(i*titleButtonw, 0, titleButtonw, titleButtonH);
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
//导航栏点击
-(void)titleClick:(UIButton *)button{
    button.selected=YES;
    self.previousBtn.selected=NO;
    self.previousBtn=button;
    
}
-(void)addtableViewToScrollView{
    
}
//加入tableview

@end
