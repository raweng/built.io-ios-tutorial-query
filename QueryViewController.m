//
//  QueryViewController.m
//  BuiltQueryDemo
//

#import "QueryViewController.h"

@interface QueryViewController ()

@end

@implementation QueryViewController

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.enablePullToRefresh = YES;
        self.fetchLimit = 99;
        self.title = @"Result";        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refresh];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath builtObject:(BuiltObject *)builtObject{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[builtObject objectForKey:@"name"]];
    
    if ([builtObject objectForKey:@"priority"]) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[builtObject objectForKey:@"priority"]];
    }
    
    return cell;
}

- (void)orderByAscendingPriority{
    [self.builtQuery orderByAscending:@"priority"];
}

- (void)orderByDescendingPriority{
    [self.builtQuery orderByDescending:@"priority"];
}

- (void)equalTo{
    [self.builtQuery whereKey:@"priority" equalTo:@2];
}

- (void)notEqualTo{
    [self.builtQuery whereKey:@"priority" notEqualTo:@2];
}

- (void)lessThan{
    [self.builtQuery whereKey:@"priority" lessThan:@4];
}

- (void)greaterThan{
    [self.builtQuery whereKey:@"priority" greaterThan:@2];
}

- (void)lessThanEqualTo{
    [self.builtQuery whereKey:@"priority" lessThanOrEqualTo:@4];
}

- (void)greaterThanEqualTo{
    [self.builtQuery whereKey:@"priority" greaterThanOrEqualTo:@2];
}

- (void)containedIn{
    [self.builtQuery whereKey:@"priority" containedIn:@[@2, @3]];
}

- (void)notContainedIn{
    [self.builtQuery whereKey:@"priority" notContainedIn:@[@2, @3]];
}

- (void)keyExists{
    [self.builtQuery whereKeyExists:@"priority"];
}

- (void)keyDoesNotExist{
    [self.builtQuery whereKeyDoesNotExist:@"priority"];
}

- (void)matchesRegex{
    [self.builtQuery whereKey:@"name" matchesRegex:@"S"];
}

- (void)matchesRegexWithModifiers{
    [self.builtQuery whereKey:@"name" matchesRegex:@"S" modifiers:@"i"];
}

- (void)includeOnly{
    [self.builtQuery includeOnlyFields:@[@"name"]];
}

- (void)includeExcept{
    [self.builtQuery includeAllFieldsExcept:@[@"priority"]];
}

- (void)after{
    [self.builtQuery afterUID:@"bltaf9aa6da85a0d49b"];
}

- (void)before{
    [self.builtQuery beforeUID:@"bltaf9aa6da85a0d49b"];
}

- (void)limitObjects{
    self.fetchLimit = 2;
    [self.builtQuery limitObjects:@2];
}

- (void)skipObjects{
    [self.builtQuery skipObjects:@2];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end