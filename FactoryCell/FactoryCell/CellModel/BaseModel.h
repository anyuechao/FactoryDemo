//
//  BaseModel.h
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//根据传过来的数据源(字典)判断,并且进行对应Model映射
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
