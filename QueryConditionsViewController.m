//
//  QueryConditionsViewController.m
//  BuiltQueryDemo
//


#import "QueryConditionsViewController.h"
#import "QueryViewController.h"
#import "AppDelegate.h"
@interface QueryConditionsViewController ()

@property (strong, nonatomic) NSArray *conditions;
@property (strong, nonatomic) QueryViewController *result;
@end

@implementation QueryConditionsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _conditions = @[@"Descending order of \"priority\"",
                        @"Ascending order of \"priority\"",
                        @"\"priority\" equal to 2",
                        @"\"priority\" not equal to 2",
                        @"\"priority\" less than 4",
                        @"\"priority\" greater than 2",
                        @"\"priority\" less than equal to 4",
                        @"\"priority\" greater than equal to 2",
                        @"\"priority\" contained in [2,3]",
                        @"\"priority\" not contained in [2,3]",
                        @"key exists \"priority\"",
                        @"key does not exist \"priority\"",
                        @"\"name\" matches regex \"S\"",
                        @"\"name\" matches regex \"S\" with modifier \"i\"",
                        @"include only field \"name\"",
                        @"include all fields except \"priority\"",
                        @"after uid bltaf9aa6da85a0d49b",
                        @"before uid bltaf9aa6da85a0d49b",
                        @"Limit result to 2",
                        @"Skip first 2"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Conditions";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _conditions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = _conditions[indexPath.row];

    [cell.textLabel setNumberOfLines:0];
    [cell.textLabel sizeToFit];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BuiltClass *builtClass = [[AppDelegate sharedInstance].builtApplication classWithUID:@"task"];
    _result = [[QueryViewController alloc]initWithStyle:UITableViewStylePlain withBuiltClass:builtClass];

    switch (indexPath.row) {
        case 0:
            [_result orderByDescendingPriority];
            break;
        case 1:
            [_result orderByAscendingPriority];
            break;
        case 2:
            [_result equalTo];
            break;
        case 3:
            [_result notEqualTo];
            break;
        case 4:
            [_result lessThan];
            break;
        case 5:
            [_result greaterThan];
            break;
        case 6:
            [_result lessThanEqualTo];
            break;
        case 7:
            [_result greaterThanEqualTo];
            break;
        case 8:
            [_result containedIn];
            break;
        case 9:
            [_result notContainedIn];
            break;
        case 10:
            [_result keyExists];
            break;
        case 11:
            [_result keyDoesNotExist];
            break;
        case 12:
            [_result matchesRegex];
            break;
        case 13:
            [_result matchesRegexWithModifiers];
            break;
        case 14:
            [_result includeOnly];
            break;
        case 15:
            [_result includeExcept];
            break;
        case 16:
            [_result after];
            break;
        case 17:
            [_result before];
            break;
        case 18:
            [_result limitObjects];
            break;
        case 19:
            [_result skipObjects];
            break;
        default:
            break;
    }
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        [_result setEdgesForExtendedLayout:UIRectEdgeBottom];
    }
    [self.navigationController pushViewController:_result animated:YES];
}

@end
