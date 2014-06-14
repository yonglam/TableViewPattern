//
//  ZoombieEntity.m
//  TableView
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import "ZombieEntity.h"
#import "EntityCellDelegate.h"

@implementation ZombieEntity

@end

// =========================================

@implementation ZombieEntity (CellForEnity)

- (id<BindingDataForEntityDelegate>) cellForEntityForTableView:(UITableView *)tableView{
    id<BindingDataForEntityDelegate> cell = [tableView dequeueReusableCellWithIdentifier:@"zoombiecellidentifier"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ZombieTableViewCell" owner:nil options:nil][0];
    }
    else{
        NSLog(@"#reused cell#");
    }
    return cell;
}

@end
