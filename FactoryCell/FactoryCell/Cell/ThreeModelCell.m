//
//  ThreeModelCell.m
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import "ThreeModelCell.h"
#import "ThreeModel.h"
#define kWidth ([UIScreen mainScreen].bounds.size.width)

@implementation ThreeModelCell
{
    UIImageView * _imageView;
    UILabel * _singerName;
    UILabel * _musicName;
}

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
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];

    [self.contentView addSubview:_imageView];
    _singerName = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, kWidth - 120, 30)];
    _singerName.textAlignment = NSTextAlignmentCenter;
    _singerName.font = [UIFont systemFontOfSize:23];
    [self.contentView addSubview:_singerName];
    
    _musicName = [[UILabel alloc] initWithFrame:CGRectMake(110, 60,  kWidth - 120, 30)];
    _musicName.textAlignment = NSTextAlignmentCenter;
    _musicName.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:_musicName];
    
}

//重写父类返回cell高度方法
+ (CGFloat)cellHeightWithModel:(BaseModel *)model
{
    return 100;
}

//重写Model的setter方法进行赋值
- (void)setModel:(BaseModel *)model
{
    ThreeModel * threeModel = (ThreeModel *)model;
    
    [_imageView ck_setImageURLStr:threeModel.picUrl];
    _singerName.text = threeModel.singer;
    _musicName.text = threeModel.name;
}

@end
