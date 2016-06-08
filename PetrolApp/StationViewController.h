//
//  StationViewController.h
//  PetrolApp
//
//  Created by Rafael Pérez on 6/7/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStarRatingView.h"
#import "Station.h"

@interface StationViewController : UIViewController
@property(strong,nonatomic) IBOutlet ASStarRatingView *starsRating;
@property(strong,nonatomic) Station *Station;
@property(strong,nonatomic) IBOutlet UILabel *lblStationName;
@property(strong,nonatomic) IBOutlet UISlider *sldWaitTime;
@property(strong,nonatomic) IBOutlet UISlider *sldGasQuantity;


@end
