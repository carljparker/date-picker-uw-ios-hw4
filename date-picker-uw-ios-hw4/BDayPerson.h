//
//  BDayPerson.h
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/11/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDayPerson : NSObject

@property (strong) NSString *name;

@property (strong) NSDate   *bDay;

- (int) daysUntilBDay;

@end