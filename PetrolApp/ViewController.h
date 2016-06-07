//
//  ViewController.h
//  PetrolApp
//
//  Created by Rafael Pérez on 4/30/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) NSMutableArray *stationsArray;

@end

