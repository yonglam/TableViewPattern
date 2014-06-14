//
//  ZoombieTableViewCell.h
//  TableView
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntityCellDelegate.h"

@interface ZombieTableViewCell : UITableViewCell

@end

@interface ZombieTableViewCell (BindingData) <BindingDataForEntityDelegate>
- (void)bindingDataForEntity:(NSObject *)entity;
@end
