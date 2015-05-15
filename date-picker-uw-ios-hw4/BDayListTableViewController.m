//
//  BDayListTableViewController.m
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/8/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//


#import "BDayListTableViewController.h"
#import "BDayTableViewCell.h"
#import "BDayPerson.h"
#import "GetBDayTableViewController.h"


static NSString *bDayListCellID = @"bDayListCell";
static NSString *bDayCustomCellID = @"bDayCustomCell";


@interface BDayListTableViewController ()

@property (strong) NSMutableArray *bDaysList;

@end


@implementation BDayListTableViewController


- (void)viewDidLoad {

    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.bDaysList = [[NSMutableArray alloc] init];
    
    //
    // Preload table with some starting birthdays
    //
    [self.bDaysList addObject:[[BDayPerson alloc] initWithName:@"Carl Parker" Year:1962 Month:2 Day:14]];
    
    [self.bDaysList addObject:[[BDayPerson alloc] initWithName:@"Nico Nico" Year:1970 Month:5 Day:10]];
    
    [self.bDaysList addObject:[[BDayPerson alloc] initWithName:@"Nico Vega" Year:2015 Month:8 Day:15]];
    
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.bDaysList count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BDayTableViewCell *bDayCell = [tableView dequeueReusableCellWithIdentifier:bDayCustomCellID forIndexPath:indexPath];
    
    BDayPerson *bDP = self.bDaysList[indexPath.row];
    
    bDayCell.nameLabel.text = bDP.name;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    bDayCell.bDayLabel.text = [dateFormatter stringFromDate:bDP.bDay];
    
    bDayCell.daysUntilLabel.text = [NSString stringWithFormat:@"%u", [bDP daysUntilBDay]];
    
    return bDayCell;
    
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [super prepareForSegue:segue sender:sender];
    
    UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
    
    GetBDayTableViewController *getBDayTableViewController = (GetBDayTableViewController *)navigationController.topViewController;
    
    getBDayTableViewController.getBDayDelegate = self;
    
}


-(void)getBDayTableViewController:(GetBDayTableViewController *)getBDayTableViewController didEnterPersonInfo:(BDayPerson *)person {
    
    NSLog(@"%@", @"About to dismiss Add UX");
    
    [self.bDaysList addObject:person];
    [self.tableView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


//
// This outlet is called when the Cancel button is tapped to
// dismisss the add-birthday UX.
//
- (IBAction)unwindToList:(UIStoryboardSegue *)segue; {
    
    NSLog(@"%@", @"Cancel button dismissal of Add-Birthday UX");
    
}


@end
