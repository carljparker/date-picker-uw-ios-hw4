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

- (int) daysUntilBDay; {
    return 40;
}

@end
