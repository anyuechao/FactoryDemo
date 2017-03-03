//
//  OneModelCell.m
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import "OneModelCell.h"
#import "OneModel.h"
#define kWidth ([UIScreen mainScreen].bounds.size.width)

@implementation OneModelCell
{
    UIImageView * _imageView;
    UILabel * _label;
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
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, kWidth - 20, 80)];

    [self.contentView addSubview:_imageView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, kWidth - 20,30)];
    
    [self.contentView addSubview:_label];
}

//重写父类返回cell高度方法
+ (CGFloat)cellHeightWithModel:(BaseModel *)model
{
    return 140;
}

//重写Model的setter方法进行赋值
- (void)setModel:(BaseModel *)model
{
    OneModel * oneModel = (OneModel *)model;
    
    [_imageView ck_setImageURLStr:oneModel.imgsrc];
    
    _label.text = oneModel.title;

}




@end

