//
//  CKWebImage.h
//  WY
//
//  Created by 陈凯 on 15/12/9.
//  Copyright © 2015年 鸥！陈凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CKWebImage : NSObject
+ (void)downloadImageWithUrlStr:(NSString *)str result:(void(^)(UIImage *image,NSError *error))returnImage;
- (void)downloadImageWithUrlStr:(NSString *)str result:(void(^)(UIImage *image,NSError *error))returnImage;
@end
@interface UIImageView (ImageURL)
- (void)ck_setImageURLStr:(NSString *)str;
- (void)ck_setImageURLStr:(NSString *)str WithHolderImage:(UIImage *)image;
@end