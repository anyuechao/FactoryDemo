//
//  BassCell.h
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseModel;
@interface BaseCell : UITableViewCell
@property (nonatomic, strong)BaseModel * model;

//简单工厂
//根据Model返回对应的Cell
+ (instancetype)cellWithModel:(BaseModel *)model;

//返回cell的高度
+ (CGFloat)cellHeightWithModel:(BaseModel *)model;

@end
