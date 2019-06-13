//
//  Test3ViewController.m
//  SDWebImage-Demo
//
//  Created by 王泽龙 on 2019/6/12.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test3ViewController.h"

@interface Test3ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation Test3ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDWebImage-所有类的图";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    // 场景 1
    [self demo1];
    
}

- (void)demo1 {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 349)];
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageNamed:@"04"];
}



- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
