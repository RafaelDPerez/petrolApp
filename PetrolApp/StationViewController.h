//
//  StationViewController.h
//  PetrolApp
//
//  Created by Rafael Pérez on 6/7/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStarRatingView.h"

@interface StationViewController : UIViewController
@property(strong,nonatomic) IBOutlet ASStarRatingView *starsRating;
@end
