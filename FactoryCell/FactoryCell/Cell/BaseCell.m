//
//  BassCell.m
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import "BaseCell.h"
#import "BaseModel.h"
#import <objc/objc-runtime.h>
@implementation BaseCell

//简单工厂
//根据Model返回对应的Cell
+(instancetype)cellWithModel:(BaseModel *)model
{
    //获取Model的名字
    NSString * modelName = [NSString stringWithUTF8String:object_getClassName(model)];
    //根据Model的名字拼接cell获取Cell类名
    NSString * cellName = [NSString stringWithFormat:@"%@Cell",modelName];
    
    //通过类名获取对象并且创建
    BaseCell * cell = [[objc_getClass(cellName.UTF8String) alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:modelName];
    
    return cell;
}

//根据model获取子类cell并且调用子类方法返回cell高度
+(CGFloat)cellHeightWithModel:(BaseModel *)model
{
    //获取Model的名字
    NSString * modelName = [NSString stringWithUTF8String:object_getClassName(model)];
   
    //根据Model的名字拼接cell获取Cell类名
    NSString * cellName = [NSString stringWithFormat:@"%@Cell",modelName];
    
    //调用子类返回cell的方法
    return [objc_getClass(cellName.UTF8String) cellHeightWithModel:model];
    
}


@end
