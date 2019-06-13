//
//  Test9ViewController.m
//  SDWebImage-Demo
//
//  Created by 王泽龙 on 2019/6/13.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test9ViewController.h"
#import <SDWebImage/SDWebImageDownloader.h>

static NSString *const url = @"https://desk-fd.zol-img.com.cn/t_s960x600c5/g4/M08/0C/09/Cg-4WVSBfl-IanN7AC__cIPrv8EAAR5PQMDkT8AL_-I272.jpg";

@interface Test9ViewController ()

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) SDWebImageDownloader *downloader;
@property(nonatomic, strong) SDWebImageDownloadToken *downloadToken;

@end

@implementation Test9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDWebImage-Downloader测试";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.downloader = [SDWebImageDownloader sharedDownloader];

    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 80, 300, 50);
    [self.view addSubview:btn1];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"开始下载" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(20, 150, 300, 50);
    [btn2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn2];
    [btn2 setTitle:@"取消下载" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(20, 230, 300, 50);
    [btn3 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:btn3];
    [btn3 setTitle:@"挂起" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(suspend) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 450, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor grayColor];
    
}

/**
 开始下载
 */
- (void)start {
    NSLog(@"开始下载");
    __weak __typeof__(self) wSelf = self;
    self.downloadToken = [self.downloader downloadImageWithURL:[NSURL URLWithString:url] options:SDWebImageDownloaderIgnoreCachedResponse|SDWebImageDownloaderAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL){
        
        NSLog(@"下载了:%ld---总共:%ld",(long)receivedSize,(long)expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        __typeof(wSelf) strongSelf = wSelf;
        strongSelf.imageView.image = image;
    }];
}
/**
 取消下载
 */
- (void)cancel {
    [self.downloader cancel:self.downloadToken];
    NSLog(@"取消下载");
}

/**
 挂起
 */
- (void)suspend {
    [self.downloader setSuspended:YES];
    NSLog(@"挂起下载");
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
