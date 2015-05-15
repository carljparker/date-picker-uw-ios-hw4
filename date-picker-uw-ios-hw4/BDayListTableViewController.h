//
//  BDayListTableViewController.h
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/8/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetBDayTableViewController.h"

@interface BDayListTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, GetBDayTableViewControllerDelegate>

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
