//
//  Test1ViewController.m
//  内存管理-Demo
//
//  Created by 王泽龙 on 2019/5/22.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test1ViewController.h"

@interface Test1ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation Test1ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDWebImage-架构图";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];


    // 场景 1
    [self demo1];

}

- (void)demo1 {
    // 1128 × 698
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 349)];
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageNamed:@"01"];
}



- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
