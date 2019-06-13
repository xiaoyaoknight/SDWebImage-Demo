//
//  Test7ViewController.m
//  SDWebImage-Demo
//
//  Created by 王泽龙 on 2019/6/13.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test7ViewController.h"
#import <SDWebImage/SDImageCache.h>
#import "Config.h"
#import <SDWebImage/SDImageCacheConfig.h>

NSString *key = @"03.png";

@interface Test7ViewController ()

@property(nonatomic,strong) SDImageCache *imageCache;
@property(nonatomic,strong) UIImageView *imageView;
@end

@implementation Test7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SDWebImage-Cache测试";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 80, 300, 50);
    [self.view addSubview:btn1];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"缓存一张图片的过程" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(20, 150, 300, 50);
    [btn2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn2];
    [btn2 setTitle:@"从缓存查询图片的过程" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 230, 200, 100)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor grayColor];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(20, 330, 300, 50);
    [btn3 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:btn3];
    [btn3 setTitle:@"模拟应用进入后台，清除缓存数据" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(20, 380, 300, 50);
    [btn4 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn4];
    [btn4 setTitle:@"发送内存警告。清除内存缓存" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btn4) forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 缓存一张图片的过程
 */
- (void)btn1 {
    [self.imageCache storeImage:[UIImage imageNamed:@"03"] forKey:key toDisk:YES completion:^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cachesDir = [paths objectAtIndex:0];

        NSLog(@"图片路径：%@",cachesDir);
        showMessage(@"回调了", self);
    }];
}

/**
 从缓存查询图片的过程
 */
- (void)btn2 {
    self.imageView.image = nil;
    [self.imageCache queryCacheOperationForKey:key done:^(UIImage * _Nullable image, NSData * _Nullable data, SDImageCacheType cacheType) {
        NSString *type;
        if (cacheType == SDImageCacheTypeMemory) {
            type = @"内存缓存";
        }else if (cacheType == SDImageCacheTypeDisk){
            type = @"磁盘缓存";
        }else{
            type = @"没有缓存";
        }
        showMessage(type, self);
        self.imageView.image = [UIImage imageWithData:data];
    }];
}

/**
 模拟应用进入后台，清除缓存数据 SDImageCache内部监听了这2个通知
 */
- (void)btn3 {
    [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidEnterBackgroundNotification object:nil];
}

/**
 发送内存警告。清除内存缓存 SDImageCache内部监听了这2个通知
 */
- (void)btn4 {
    [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}


- (SDImageCache *)imageCache {
    if (_imageCache == nil) {
        _imageCache = [SDImageCache sharedImageCache];
    }
    return _imageCache;
}



- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

