//
//  ZoombieEntity.h
//  TableView
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntityCellDelegate.h"

@interface ZombieEntity : NSObject
@property (nonatomic,copy) NSString *name;
@end

@interface ZombieEntity (CellForEnity) <CellForEntityDelegate>
- (UITableViewCell *) cellForEntityForTableView:(UITableView *)tableView;
@end