//
//  SubTableViewController.m
//  TableView
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import "SubTableViewController.h"
#import "ZombieEntity.h"
#import "TableViewDelegateAndDataSource.h"

@interface SubTableViewController ()
@property (nonatomic) TableViewDelegateAndDataSource *dataSource;
@end

@implementation SubTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *names  = @[@"kepa", @"lala", @"juju", @"papa", @"erxin", @"koubu", @"dada", @"xiaoyew", @"zhuzhu", @"haha", @"hehe", @"huazhai", @"dandan", @"agou", @"amao", @"yaya", @"yunzai"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
    for (NSString *name in names) {
        ZombieEntity *entity = [[ZombieEntity alloc] init];
        entity.name = name;
        [array addObject:entity];
    }
    
    self.dataSource = [[TableViewDelegateAndDataSource alloc] initWithDataArr:array];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    self.dataSource.tableViewCellDidSelectedBlock = ^(id entity){
        NSLog(@"select: %@", [entity name]);
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end