TableViewPattern
================

##Problems

There are some common problems when dealing with UITableView. First, the class of UITableViewController is easy to be large and hard to maintain. Second, the logic and code of UITableView's data source and delegate is hard to be reusable. Third, the logic in `tableView:cellForRowAtIndexPath:` always be mussy because you have to 1) determin which type of cell to be created base on the type of corresponding entity, and then 2) custom the cell with the information of entity.  

##Pattern

What is the best practise about the pattern of using UITableView? According to the above problems, we can make some useful patterns to avoid them.

1. Define a protocal for entity model to generate a corresponding UITableViewCell.
````
@protocol CellForEntityDelegate <NSObject>
- (id<BindingDataForEntityDelegate>) cellForEntityForTableView:(UITableView *)tableView;
@end
````

Every type of entity should define a category to implement this protocol.
````
@interface ZombieEntity (CellForEnity) <CellForEntityDelegate>
- (UITableViewCell *) cellForEntityForTableView:(UITableView *)tableView;
@end

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

````

1. Define a protocal for every type of UITableViewCell or its subclass to bind data from corresponding entity.
````
@protocol BindingDataForEntityDelegate<NSObject>
- (void) bindingDataForEntity:(NSObject *)entity;
@end
````

Every type of cell should define a category to implement this protocol.
````
@interface ZombieTableViewCell (BindingData) <BindingDataForEntityDelegate>
- (void)bindingDataForEntity:(NSObject *)entity;
@end

@implementation ZombieTableViewCell(BindingData)
- (void)bindingDataForEntity:(NSObject *)entity{
    ZombieEntity *zombie = (ZombieEntity *)entity;
    [self.textLabel setText:zombie.name];
}
@end
````

1. Abstract the UITableView delegate and data resource to a class from the UITableViewController. This makes the viewController cleaner and code more reusable.
````
@interface TableViewDelegateAndDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) void(^tableViewCellDidSelectedBlock)(id entity);
- (instancetype) initWithDataArr:(NSArray *)dataArr;
@end
````
When user initialize a instance, pass a data array which consists of differents types of entities. Every type of entity has a different type of cell to reprented its infomation. 
Note that we also define a block property for cell selected action. It should be defined with `copy` attribute because it's a block.

In the `tableView:cellForRowAtIndexPath:` we only need to fetch an entity, then get a cell from it (`CellForEntityDelegate`), and then render the cell by passing the entity to it(`BindingDataForEntityDelegate`). Code is really simple and magical.

````
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<CellForEntityDelegate> entity = self.dataArr[indexPath.row];
    id<BindingDataForEntityDelegate> cell = [entity cellForEntityForTableView:tableView];
    [cell bindingDataForEntity:entity];
    return (UITableViewCell *)cell;
}
````

1. In the veiw controller, we create a collection of entities,  and create an instance of `TableViewDelegateAndDataSource` with the data, then set the instance as the delegate and data source of the table view. 
````
@interface SubTableViewController ()
@property (nonatomic) TableViewDelegateAndDataSource *dataResource;
@end

- (void)viewDidLoad
{
 	// Other setup ...

    self.dataSource = [[TableViewDelegateAndDataSource alloc] initWithDataArr:array];
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    self.dataSource.tableViewCellDidSelectedBlock = ^(id entity){
        NSLog(@"select: %@", [entity name]);
    };
}

````

##Conclusion

Every time you have a new type entity and corresponding cell, just 1) make the entity confirm to the `CellForEntityDelegate` protocol, 2) make the cell confirm to the `BindingDataForEntityDelegate` protocol, 3) create an instance of `TableViewDelegateAndDataSource` and assign it to your table view. All this seperate your code to the very place and finally make your code cleaner and more reusable. There may be some mistakes, if you find one please let me know. 

##Related Article

- [How to avoid big and clumsy UITableViewController on iOS?](http://programmers.stackexchange.com/questions/177668/how-to-avoid-big-and-clumsy-uitableviewcontroller-on-ios) 
- [Lighter View Controllers](http://www.objc.io/issue-1/lighter-view-controllers.html#controllers)
