//
//  RootTableViewController.m
//  FactoryCell
//
//  Created by 李士杰 on 15/12/14.
//  Copyright © 2015年 李士杰. All rights reserved.
//

#import "RootTableViewController.h"
#import "BaseModel.h"
#import "BaseCell.h"
@interface RootTableViewController ()
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];

    for (NSDictionary * dict in array) {
        BaseModel * model = [BaseModel modelWithDictionary:dict];
        [self.dataArray addObject:model];
        
    }
    NSLog(@"%@",self.dataArray);
    
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseModel * model = self.dataArray[indexPath.row];
    BaseCell * cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithUTF8String:object_getClassName(model)]];

    if (nil == cell) {
        
        cell = [BaseCell cellWithModel:model];
    }
    [cell setModel:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取当前model
    BaseModel * model = self.dataArray[indexPath.row];
    //父类指针指向子类对象
    return [BaseCell cellHeightWithModel:model];
}


@end
