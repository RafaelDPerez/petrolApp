//
//  StationCell.h
//  PetrolApp
//
//  Created by Rafael Pérez on 4/30/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStarRatingView.h"

@interface StationCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *stationName;
@property (strong, nonatomic) IBOutlet UILabel *stationAddress;
@property (strong, nonatomic) IBOutlet UILabel *waitTimepctg;
@property (strong, nonatomic) IBOutlet UILabel *gasQuantitypctg;
@property (retain, nonatomic) IBOutlet ASStarRatingView *staticStarRatingView;
@property (strong, nonatomic) IBOutlet UIProgressView *waitTime;
@property (strong, nonatomic) IBOutlet UIProgressView *gasQuantity;

@end
