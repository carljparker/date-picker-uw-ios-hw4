//
//  BDayListTableViewController.h
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/8/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDayListTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
