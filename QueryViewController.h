//
//  QueryViewController.h
//  BuiltQueryDemo
//


#import <BuiltIO/BuiltIO.h>
#import <BuiltIO/BuiltUITableViewController.h>
@interface QueryViewController : BuiltUITableViewController

- (void)orderByAscendingPriority;
- (void)orderByDescendingPriority;
- (void)equalTo;
- (void)notEqualTo;
- (void)lessThan;
- (void)greaterThan;
- (void)lessThanEqualTo;
- (void)greaterThanEqualTo;
- (void)containedIn;
- (void)notContainedIn;
- (void)keyExists;
- (void)keyDoesNotExist;
- (void)matchesRegex;
- (void)matchesRegexWithModifiers;
- (void)includeOnly;
- (void)includeExcept;
- (void)after;
- (void)before;
- (void)limitObjects;
- (void)skipObjects;
@end
