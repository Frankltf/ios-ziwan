//
//  XMGSubTagController.m
//  xiaofei
//
//  Created by admin on 2017/8/28.
//  Copyright © 2017年 刘腾飞. All rights reserved.
//

#import "XMGSubTagController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "XMGSubTagCell.h"
#import "XMGSubTagItem.h"

static NSString * const ID=@"cell";
@interface XMGSubTagController ()
@property (nonatomic,strong)NSArray *lodaArr;

@end

@implementation XMGSubTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self regist];
    self.title=@"订阅";
}

//注册
-(void)regist{
    [self.tableView registerNib:[UINib nibWithNibName:@"XMGSubTagCell" bundle:nil] forCellReuseIdentifier:ID];
}
//加载数据
-(void)loadData{
    AFHTTPSessionManager *mgr=[AFHTTPSessionManager manager];
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _lodaArr=[XMGSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lodaArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    XMGSubTagItem *subtagitem=self.lodaArr[indexPath.row];
    cell.item=subtagitem;
    
    return cell;
}


@end
