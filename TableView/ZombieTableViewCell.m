//
//  ZoombieTableViewCell.m
//  TableView
//
//  Created by Lin Yong on 14-6-14.
//  Copyright (c) 2014年 LY. All rights reserved.
//

#import "ZombieTableViewCell.h"
#import "ZombieEntity.h"

@implementation ZombieTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@implementation ZombieTableViewCell(BindingData)

- (void)bindingDataForEntity:(NSObject *)entity{
    ZombieEntity *zombie = (ZombieEntity *)entity;
    [self.textLabel setText:zombie.name];
}

@end