//
//  BDayPerson.m
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/11/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import "BDayPerson.h"

@implementation BDayPerson

-(instancetype) init;
{
    
    //
    // returns mock data
    //
    self = [super init];
    
    if (self)
    {

        self.name = @"Carl Parker";
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        [components setWeekday:2]; // Monday
        
        [components setWeekdayOrdinal:1]; // The first Monday in the month
        
        [components setMonth:5]; // May
        
        [components setYear:2008];
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        self.bDay = [gregorian dateFromComponents:components];
        
        NSLog( @"DATE: %@", self.bDay );

    }
    
    return self;
    
}


-(instancetype) initWithName:(NSString *)name
                        Year:(int)year
                       Month:(int)month
                         Day:(int)day;
{
    
    //
    // returns mock data
    //
    self = [super init];
    
    if (self)
    {
        
        self.name = name;
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        [components setYear:year];

        [components setMonth:month];
        
        [components setDay:day];
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        self.bDay = [gregorian dateFromComponents:components];
        
        NSUInteger unitFlags = NSCalendarUnitDay;
        NSDateComponents *extracted = [gregorian components:unitFlags fromDate:self.bDay];
        
        NSLog( @"DATE: %@, %u", self.bDay, [extracted day] );
        
    }
    
    return self;
    
}


- (int) daysUntilBDay; {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger unitFlags = NSCalendarUnitDay;
    
    NSDate *today = [[NSDate alloc] init];
    
    NSLog(@"%@", today);
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:today
                                                  toDate:self.bDay
                                                 options:0];
    
    NSInteger days = [components day];
    
    return days;
    
}


@end
