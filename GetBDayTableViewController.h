//
//  GetBDayTableViewController.h
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/14/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BDayPerson.h"


@protocol GetBDayTableViewControllerDelegate;


@interface GetBDayTableViewController : UITableViewController

@property (nonatomic, weak) id<GetBDayTableViewControllerDelegate> getBDayDelegate;

@end


@protocol GetBDayTableViewControllerDelegate <NSObject>

@required

- (void)getBDayTableViewController:(GetBDayTableViewController *)getBDayTableViewController
                didEnterPersonInfo:(BDayPerson *)person;

@end

