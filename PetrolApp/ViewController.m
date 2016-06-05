//
//  ViewController.m
//  PetrolApp
//
//  Created by Rafael Pérez on 4/30/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "ViewController.h"
#import "Station.h"
#import "StationCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize stationsArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    stationsArray = [[NSMutableArray alloc] init];
    Station *station1 = [[Station alloc]init];
    station1.Name = @"AP Filling Station";
    station1.Longitude = @"6.469438";
    station1.Latitude = @"3.578921";
    Station *station2 = [[Station alloc]init];
    station2.Name = @"AP Filling Station";
    station2.Longitude = @"6.469438";
    station2.Latitude = @"3.578921";
    Station *station3 = [[Station alloc]init];
    station3.Name = @"AP Filling Station";
    station3.Longitude = @"6.469438";
    station3.Latitude = @"3.578921";
    Station *station4 = [[Station alloc]init];
    station4.Name = @"Mobil";
    station4.Longitude = @"6.469438";
    station4.Latitude = @"3.578921";
    Station *station5 = [[Station alloc]init];
    station5.Name = @"AP Filling Station";
    station5.Longitude = @"6.469438";
    station5.Latitude = @"3.578921";
    Station *station6 = [[Station alloc]init];
    station6.Name = @"Mrs Filling Station";
    station6.Longitude = @"6.469438";
    station6.Latitude = @"3.578921";
    Station *station7 = [[Station alloc]init];
    station7.Name = @"AP Filling Station";
    station7.Longitude = @"6.469438";
    station7.Latitude = @"3.578921";
    [stationsArray addObject:station1];
    [stationsArray addObject:station2];
    [stationsArray addObject:station3];
    [stationsArray addObject:station4];
    [stationsArray addObject:station5];
    [stationsArray addObject:station6];
    [stationsArray addObject:station7];
    
    
    CLLocationCoordinate2D location;
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    NSString *lat = @"6.469438";
    NSString *longitude = @"3.578921";
    location.latitude = lat.doubleValue;
    location.longitude = longitude.doubleValue;
    point1.coordinate = CLLocationCoordinate2DMake(lat.doubleValue, longitude.doubleValue);
    point1.title = @"AP Filling Station";
    [self.mapView addAnnotation:point1];
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    NSString *lat2 = @"6.546609";
    NSString *longitude2 = @"3.238251";
    location.latitude = lat2.doubleValue;
    location.longitude = longitude2.doubleValue;
    point2.coordinate = CLLocationCoordinate2DMake(lat2.doubleValue, longitude2.doubleValue);
    point2.title = @"AP Filling Station";
    [self.mapView addAnnotation:point2];
    
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc] init];
    NSString *lat3 = @"6.608219";
    NSString *longitude3 = @"3.362096";
    location.latitude = lat3.doubleValue;
    location.longitude = longitude3.doubleValue;
    point3.coordinate = CLLocationCoordinate2DMake(lat3.doubleValue, longitude3.doubleValue);
    point3.title = @"AP Filling Station";
    [self.mapView addAnnotation:point3];
    
    MKPointAnnotation *point4 = [[MKPointAnnotation alloc] init];
    NSString *lat4 = @"6.558039";
    NSString *longitude4 = @"3.331197";
    location.latitude = lat4.doubleValue;
    location.longitude = longitude4.doubleValue;
    point4.coordinate = CLLocationCoordinate2DMake(lat4.doubleValue, longitude4.doubleValue);
    point4.title = @"Mobil";
    [self.mapView addAnnotation:point4];
    
    MKPointAnnotation *point5 = [[MKPointAnnotation alloc] init];
    NSString *lat5 = @"6.559405";
    NSString *longitude5 = @"3.350267";
    location.latitude = lat5.doubleValue;
    location.longitude = longitude5.doubleValue;
    point5.coordinate = CLLocationCoordinate2DMake(lat5.doubleValue, longitude5.doubleValue);
    point5.title = @"AP Filling Station";
    [self.mapView addAnnotation:point5];
    
    MKPointAnnotation *point6 = [[MKPointAnnotation alloc] init];
    NSString *lat6 = @"6.545628";
    NSString *longitude6 = @"3.39403";
    location.latitude = lat6.doubleValue;
    location.longitude = longitude6.doubleValue;
    point6.coordinate = CLLocationCoordinate2DMake(lat6.doubleValue, longitude6.doubleValue);
    point6.title = @"Mrs Filling Station";
    [self.mapView addAnnotation:point6];
    
    MKPointAnnotation *point7 = [[MKPointAnnotation alloc] init];
    NSString *lat7 = @"6.524379";
    NSString *longitude7 = @"3.379206";
    location.latitude = lat7.doubleValue;
    location.longitude = longitude7.doubleValue;
    point7.coordinate = CLLocationCoordinate2DMake(lat7.doubleValue, longitude7.doubleValue);
    point7.title = @"AP Filling Station";
    [self.mapView addAnnotation:point7];
    
    //CLLocationCoordinate2D NigCoord = CLLocationCoordinate2DMake(10.438520, 8.876953);
    CLLocationCoordinate2D LagosCoord = CLLocationCoordinate2DMake(6.524379, 3.379206);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(LagosCoord, 8000, 8000);
    [self.mapView setRegion:region animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [stationsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"StationCell";
//    StationCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    Station *station;
    if (!cell) {
        cell = [[StationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell= [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        //station = [filteredguestArray objectAtIndex:indexPath.row];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
        station = [stationsArray objectAtIndex:indexPath.row];
        
    }
    
//    cell.stationName.text = station.Name;
//    cell.stationAddress.text = station.Name;

    cell.textLabel.text = station.Name;

    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
