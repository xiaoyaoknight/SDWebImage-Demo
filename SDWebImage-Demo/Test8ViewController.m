//
//  Test8ViewController.m
//  SDWebImage-Demo
//
//  Created by 王泽龙 on 2019/6/13.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test8ViewController.h"
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/FLAnimatedImageView+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *url = @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3132193725,2703022779&fm=26&gp=0.jpg";
//大图。
static NSString *bigUrl = @"http://img.daimg.com/uploads/allimg/190524/1-1Z524142151.jpg";
//gif图片
static NSString *gifUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560428066199&di=7d7223afbb9901c4a29c9a141f039ddc&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170805%2F19ad9705aec44c81af1760d40622c9fb.jpg";

@interface Test8ViewController ()

@property (strong, nonatomic)  UIImageView *imageView;
//@property (strong, nonatomic)  UIImageView *imageView2;
@property (strong, nonatomic)  FLAnimatedImageView *animateImageView;
@end

@implementation Test8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDWebImage-Manager测试";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 80, 300, 50);
    [self.view addSubview:btn1];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"图片处理与不处理解压缩" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(20, 150, 300, 50);
    [btn2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn2];
    [btn2 setTitle:@"图片加载Cookie处理" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];


    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(20, 230, 300, 50);
    [btn3 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:btn3];
    [btn3 setTitle:@"图片加载HTTPS处理" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3) forControlEvents:UIControlEventTouchUpInside];

    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(20, 280, 300, 50);
    [btn4 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn4];
    [btn4 setTitle:@"图片加载Background处理" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(20, 380, 300, 50);
    [btn5 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn5];
    [btn5 setTitle:@"动态图片加载处理" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(btn5) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 450, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor grayColor];
    
    
    self.animateImageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 650, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:self.animateImageView];
    self.animateImageView.backgroundColor = [UIColor darkGrayColor];
    
  

}

/**
 图片加载以后,在图片解压缩之前。是否做处理
 */
- (void)btn1 {
    self.imageView.image = nil;
    SDWebImageOptions type;
    //图片处理以后，再解压缩。然后再缓存
    /*
     通过是否设置SDWebImageScaleDownLargeImages属性。我们发现缓存的图片大小不同。如果设置了，则图片大小有11k。没有设置，则大小只有7k
     */
    if (true) {
        type = SDWebImageScaleDownLargeImages;
    }
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:bigUrl] options:type progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        NSLog(@"收到：%ld---总共：%ld",(long)receivedSize,(long)expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.imageView.image = image;
    }];
}

/**
 同一个请求。第二次待上cookie
 */
- (void)btn2 {
    
    self.imageView.image = nil;
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:url] options:SDWebImageHandleCookies progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
         NSLog(@"收到：%ld---总共：%ld",(long)receivedSize,(long)expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.imageView.image = image;
    }];
}

/**
 HTTPS处理.忽略SSL证书
 */
- (void)btn3 {
    self.imageView.image = nil;
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:bigUrl] options:SDWebImageAllowInvalidSSLCertificates progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        NSLog(@"收到：%ld---总共：%ld",(long)receivedSize,(long)expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.imageView.image = image;
    }];
}

/**
 应用进入后台下载处理
 */
- (void)btn4 {
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:bigUrl] options:SDWebImageAllowInvalidSSLCertificates|SDWebImageContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        NSLog(@"收到：%ld---总共：%ld",(long)receivedSize,(long)expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.imageView.image = image;
    }];
}

/**
 gif动态图片处理
 */
- (void)btn5 {
    [self.animateImageView sd_setImageWithURL:[NSURL URLWithString:gifUrl] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates|SDWebImageTransformAnimatedImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"下载完成");
    }];

}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
