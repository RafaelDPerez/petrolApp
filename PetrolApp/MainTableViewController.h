//
//  MainTableViewController.h
//  PetrolApp
//
//  Created by Rafael Pérez on 5/9/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Station.h"
#import "ASStarRatingView.h"
@interface MainTableViewController : UITableViewController

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) Station *selectedStation;
@property (strong,nonatomic) NSMutableArray *stationsArray;

@end
