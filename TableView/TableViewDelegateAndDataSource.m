//
//  TableViewDelegateAndDataResource.m
//  TableViewPattern
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import "TableViewDelegateAndDataSource.h"
#import "EntityCellDelegate.h"

@interface TableViewDelegateAndDataSource()
@property (nonatomic) NSArray *dataArr;
@end

@implementation TableViewDelegateAndDataSource

- (instancetype) initWithDataArr:(NSArray *)dataArr{
    if (self = [super init]) {
        _dataArr = dataArr;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CellForEntityDelegate> entity = self.dataArr[indexPath.row];
    id<BindingDataForEntityDelegate> cell = [entity cellForEntityForTableView:tableView];
    [cell bindingDataForEntity:entity];
    return (UITableViewCell *)cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id entity = self.dataArr[indexPath.row];
    if (self.tableViewCellDidSelectedBlock) {
        self.tableViewCellDidSelectedBlock(entity);
    }
}


@end
