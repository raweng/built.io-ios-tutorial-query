//
//  QueryViewController.h
//  BuiltQueryDemo
//
//  Created by Akshay Mhatre on 14/03/14.
//  Copyright (c) 2014 raweng. All rights reserved.
//

#import <BuiltIO/BuiltIO.h>

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
