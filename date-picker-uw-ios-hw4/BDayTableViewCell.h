//
//  BDayTableViewCell.h
//  date-picker-uw-ios-hw4
//
//  Created by Parker, Carl (HBO) on 5/10/15.
//  Copyright (c) 2015 Parker, Carl (HBO). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDayTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *daysUntilLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *bDayLabel;


@end
