//
//  EntityCellDelegate.h
//  TableViewPattern
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityCellDelegate.h"

@protocol BindingDataForEntityDelegate;

@protocol CellForEntityDelegate <NSObject>
- (id<BindingDataForEntityDelegate>) cellForEntityForTableView:(UITableView *)tableView;
@end

@protocol BindingDataForEntityDelegate<NSObject>
- (void) bindingDataForEntity:(NSObject *)entity;
@end

