//
//  TableViewDelegateAndDataResource.h
//  TableViewPattern
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewDelegateAndDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) void(^tableViewCellDidSelectedBlock)(id entity);

- (instancetype) initWithDataArr:(NSArray *)dataArr;

@end
