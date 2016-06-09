//
//  StationViewController.m
//  PetrolApp
//
//  Created by Rafael Pérez on 6/7/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "StationViewController.h"

@interface StationViewController ()

@end

@implementation StationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.Station.Name;
    _starsRating.userInteractionEnabled = NO;
    _sldWaitTime.enabled = NO;
    _sldGasQuantity.enabled = NO;
    _starsRating.canEdit = YES;
    _starsRating.maxRating = 5;
    _starsRating.rating = [self.Station.Rating floatValue];
    _lblStationName.text = self.Station.Name;
    _sldWaitTime.maximumValue = 1;
    _sldGasQuantity.maximumValue = 1;
    [_sldGasQuantity setValue:[self.Station.gasQuantity floatValue]];
    [_sldWaitTime setValue:[self.Station.waitTime floatValue]];
    
    
    CLLocationCoordinate2D location;
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    NSString *lat = self.Station.Longitude;
    NSString *longitude = self.Station.Latitude;
    location.latitude = lat.doubleValue;
    location.longitude = longitude.doubleValue;
    point1.coordinate = CLLocationCoordinate2DMake(lat.doubleValue, longitude.doubleValue);
    point1.title = self.Station.Name;
    [self.mapView addAnnotation:point1];
    
    //CLLocationCoordinate2D NigCoord = CLLocationCoordinate2DMake(10.438520, 8.876953);
   // CLLocationCoordinate2D LagosCoord = CLLocationCoordinate2DMake(6.524379, 3.379206);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 11000, 11000);
    [self.mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)editStationInfo:(id)sender{
    if ([_btnEditInfo.titleLabel.text isEqual:@"Edit"]) {
        [_btnEditInfo setTitle:@"Save" forState:UIControlStateNormal];
        _starsRating.userInteractionEnabled = YES;
        _sldWaitTime.enabled = YES;
        _sldGasQuantity.enabled = YES;
        
    }
    if ([_btnEditInfo.titleLabel.text isEqual:@"Save"]) {
        [_btnEditInfo setTitle:@"Edit" forState:UIControlStateNormal];
        _starsRating.userInteractionEnabled = NO;
        _sldWaitTime.enabled = NO;
        _sldGasQuantity.enabled = NO;
    }

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"MyLocation";
    //MKAnnotationView *annotationView = (MKAnnotationView *) [_mapView ];
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    annotationView.annotation = annotation;
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"Gas Station Filled-50"];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    //MyLocation *location = (MyLocation*)view.annotation;
    MKPointAnnotation *hola = [[MKPointAnnotation alloc] init];
    hola = view.annotation;
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:hola.coordinate
                              addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = hola.title;
    
    
    NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
    [mapItem openInMapsWithLaunchOptions:launchOptions];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
