//
//  RootViewController.m
//  Block-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "RootViewController.h"
#import "Test1ViewController.h"
#import "Test2ViewController.h"
#import "Test3ViewController.h"
#import "Test4ViewController.h"
#import "Test5ViewController.h"
#import "Test6ViewController.h"
#import "Test7ViewController.h"
#import "Test8ViewController.h"
#import "Test9ViewController.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDWebImage-Demo";
    
    self.dataArray = [[NSArray alloc] initWithObjects:
                      @"SDWebImage-架构图",
                      @"SDWebImage-模块图",
                      @"SDWebImage-所有类的图",
                      @"SDWebImage-各部分功能总述",
                      @"SDWebImage-实现流程",
                      @"SDWebImage-根据图片数据获取图片类型、得到2x。3x图、解压缩",
                      @"SDWebImage-Cache测试",
                      @"SDWebImage-Manager测试",
                      @"SDWebImage-Downloader测试",nil];
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableview];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.tableview.rowHeight = 44;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}


#pragma mark –-------------------------- tableview delegate （代理回调）–--------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        Test1ViewController *test1VC = [[Test1ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test1VC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    if (indexPath.row == 1) {
        Test2ViewController *test2VC = [[Test2ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test2VC];
        [self presentViewController:nav animated:YES completion:nil];
    }

    if (indexPath.row == 2) {
        Test3ViewController *test3VC = [[Test3ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test3VC];
        [self presentViewController:nav animated:YES completion:nil];
    }

    if (indexPath.row == 3) {
        Test4ViewController *test4VC = [[Test4ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test4VC];
        [self presentViewController:nav animated:YES completion:nil];
    }

    if (indexPath.row == 4) {
        Test5ViewController *test5VC = [[Test5ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test5VC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    

    if (indexPath.row == 5) {
        Test6ViewController *test6VC = [[Test6ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test6VC];
        [self presentViewController:nav animated:YES completion:nil];
    }

    if (indexPath.row == 6) {
        Test7ViewController *test7VC = [[Test7ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test7VC];
        [self presentViewController:nav animated:YES completion:nil];
    }

    if (indexPath.row == 7) {
        Test8ViewController *test8VC = [[Test8ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test8VC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    if (indexPath.row == 8) {
        Test9ViewController *test8VC = [[Test9ViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test8VC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end
