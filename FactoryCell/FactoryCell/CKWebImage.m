//
//  CKWebImage.m
//  WY
//
//  Created by 陈凯 on 15/12/9.
//  Copyright © 2015年 鸥！陈凯. All rights reserved.
//

#import "CKWebImage.h"
#import <CommonCrypto/CommonCrypto.h>

@interface CKWebImage ()

@end
@implementation CKWebImage
+ (instancetype)defaultManager {
    static CKWebImage *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [CKWebImage new];
    });
    return manager;
}
+ (void)downloadImageWithUrlStr:(NSString *)str result:(void (^)(UIImage *, NSError *))returnImage {
    CKWebImage *manager = [CKWebImage defaultManager];
    [manager downloadImageWithUrlStr:str result:^(UIImage *image, NSError *error) {
        returnImage(image, error);
    }];
}

- (void)downloadImageWithUrlStr:(NSString *)str result:(void (^)(UIImage *, NSError *))returnImage {
    NSURL *imageURL = [NSURL URLWithString:str];
    // 转换md5获取文件路径
    NSString *name = [self md5String:str];
    NSString *filePath = [[self caches]stringByAppendingPathComponent:name];
    NSData *imageData = [[NSData alloc]initWithContentsOfFile:filePath];
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        returnImage(image, nil);
        return;
    }
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"图片下载出错:%@",error);
            return;
        }
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (!image) {
            NSLog(@"图片格式问题");
            return;
        }
        [data writeToFile:filePath atomically:YES];
        @autoreleasepool {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [[UIImage alloc]initWithData:data];
                returnImage(image,error);
            });
        }
    }];
    [dataTask resume];
}
// 文件路径
- (NSString *)caches {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}
// 得到通用散列字符串
- (NSString *)md5String:(NSString *)str {
    unsigned char result[16];
    
    CC_MD5(str.UTF8String, (unsigned int)strlen(str.UTF8String), result);
    NSMutableString *resultStr = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [resultStr appendFormat:@"%02x",result[i]];
    }
    return resultStr;
}
@end

@implementation UIImageView (ImageURL)

- (void)ck_setImageURLStr:(NSString *)str {
    [self ck_setImageURLStr:str WithHolderImage:nil];
}

-(void)ck_setImageURLStr:(NSString *)str WithHolderImage:(UIImage *)image {
    self.image = image;
    __weak UIImageView *myImageView = self;
    [CKWebImage downloadImageWithUrlStr:str result:^(UIImage *image, NSError *error) {
        if (error) {
            return;
        }
        if (!image) {
            return;
        }
        myImageView.image = image;
    }];
}

@end