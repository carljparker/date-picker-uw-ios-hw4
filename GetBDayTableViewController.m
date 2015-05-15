//
//  GetBDayTableViewController.m
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/14/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//


#import "GetBDayTableViewController.h"


@interface GetBDayTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) IBOutlet UIDatePicker *chosenDate;

@end


@implementation GetBDayTableViewController


//
// Helper method to change a date object
// to the standard format we're using.
//
- (NSString *)textFromDate:(NSDate *)date; 
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    return ( [dateFormatter stringFromDate:date] );
    
}


- (void)viewDidLoad 
{
 
    [super viewDidLoad];
    
    //
    // Preload fields so that we handle
    // the case where the user doesn't change
    // the values but just taps "Done"
    //
    self.nameField.text = @"Barack Obama";
    self.dateField.text = [self textFromDate:self.chosenDate.date];
    
}


- (IBAction)pickerValueChanged:(id)sender 
{
    
    NSLog(@"%@", [self textFromDate:self.chosenDate.date]);
    
    self.dateField.text = [self textFromDate:self.chosenDate.date];
    
}


- (IBAction)doneButtonTapped:(id)sender 
{
    
    NSLog(@"%@", @"Done Button Tapped");
    
    NSLog(@"%@", self.nameField.text);
    
    NSLog(@"%@", self.chosenDate.date);
    
    BDayPerson *bDayPerson = [[BDayPerson alloc] initWithName:self.nameField.text Date:self.chosenDate.date];

    [self.getBDayDelegate getBDayTableViewController:self didEnterPersonInfo:bDayPerson];

}


- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

