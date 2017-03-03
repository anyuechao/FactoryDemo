//
//  BaseModel.m
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import "BaseModel.h"
#import "OneModel.h"
#import "TwoModel.h"
#import "ThreeModel.h"

@implementation BaseModel

//根据传过来的数据源(字典)判断,并且进行对应Model映射
+ (instancetype)modelWithDictionary:(NSDictionary *)dict
{
    BaseModel * model = nil;
    if ([dict[@"tag"] isEqualToString:@"Top News"]) {
        model = [OneModel new];
    }else if ([dict[@"tag"] isEqualToString:@"imgextra"]) {
        model = [TwoModel new];
        
    }else if ([dict[@"tag"] isEqualToString:@"music"]) {
        model = [ThreeModel new];
    }else {
        
    }
    
    //字典对Model赋值
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
