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
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface StationViewController : UIViewController<MKMapViewDelegate>
@property(strong,nonatomic) IBOutlet ASStarRatingView *starsRating;
@property(strong,nonatomic) Station *Station;
@property(strong,nonatomic) IBOutlet UILabel *lblStationName;
@property(strong,nonatomic) IBOutlet UISlider *sldWaitTime;
@property(strong,nonatomic) IBOutlet UISlider *sldGasQuantity;
@property(strong,nonatomic) IBOutlet UIButton *btnTakeMeThere;
@property(strong,nonatomic) IBOutlet UIButton *btnEditInfo;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

-(IBAction)editStationInfo:(id)sender;


@end
