//
//  TwoModelCell.m
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import "TwoModelCell.h"
#import "TwoModel.h"
#define kWidth ([UIScreen mainScreen].bounds.size.width - 40)/3.0

@implementation TwoModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLayoutViews];
    }
    return self;
}

//对cell进行布局
- (void)setLayoutViews
{
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10 + kWidth * i, 10, kWidth, kWidth)];
        imageView.tag = 100 + i;
        [self.contentView addSubview:imageView];
    }
}

//重写父类返回cell高度方法
+ (CGFloat)cellHeightWithModel:(BaseModel *)model
{
    return kWidth + 20;
}

//重写Model的setter方法进行赋值
- (void)setModel:(BaseModel *)model
{
    TwoModel * twoModel = (TwoModel *)model;
    UIImageView * oneImageView = (UIImageView*)[self.contentView viewWithTag:100];
    UIImageView * twoImageView = (UIImageView*)[self.contentView viewWithTag:101];
    UIImageView * threeImageView = (UIImageView*)[self.contentView viewWithTag:102];
    [oneImageView ck_setImageURLStr:twoModel.imgsrc1];
    [twoImageView ck_setImageURLStr:twoModel.imgsrc2];
    [threeImageView ck_setImageURLStr:twoModel.imgsrc3];
}


@end
