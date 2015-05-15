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
    
    [self.bDaysList addObject:[[BDayPerson alloc] initWithName:@"Carl Parker" Year:1962 Month:2 Day:14]];
    
    [self.bDaysList addObject:[[BDayPerson alloc] initWithName:@"Nico Nico" Year:1970 Month:5 Day:10]];
    
    [self.bDaysList addObject:[[BDayPerson alloc] initWithName:@"Nico Vega" Year:2015 Month:8 Day:15]];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)unwindToList:(UIStoryboardSegue *)segue; {
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
