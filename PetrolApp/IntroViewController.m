//
//  IntroViewController.m
//  PetrolApp
//
//  Created by Rafael Pérez on 5/24/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "IntroViewController.h"


@interface IntroViewController ()
{
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@end

@implementation IntroViewController
@synthesize lblselectedFuel;
@synthesize txtLocation;
@synthesize locationManager;

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    geocoder = [[CLGeocoder alloc] init];
    if (locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationManager.delegate = self;
        [locationManager requestAlwaysAuthorization];
    }
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100.0, 100.0, 25.0, 25.0)];
    [imageview setImage:[UIImage imageNamed:@"NearMe"]];
    [imageview setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refresh:)];
    [singleTap setNumberOfTapsRequired:1];
    [imageview addGestureRecognizer:singleTap];
    txtLocation.rightViewMode = UITextFieldViewModeAlways;
    txtLocation.rightView = imageview;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Turn off the location manager to save power.
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManager delegate methods

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *newLocation = [locations lastObject];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            txtLocation.text = placemark.postalCode;
   
            
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
    // Turn off the location manager to save power.
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Cannot find the location.");
}


-(IBAction)refresh:(id)sender{
[locationManager startUpdatingLocation];
    
}

-(IBAction)findStations:(id)sender{

    if([txtLocation.text isEqual:@""])
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"No location provided"
                                      message:@"Please provide a ZIP code or press the location button."
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:ok];
       // [self presentViewController:alert animated:YES completion:nil];
       [self performSegueWithIdentifier:@"callStations" sender:nil];
    }
    else{
        if (_sgmGasType.selectedSegmentIndex == 0) {
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Test"
                                          message:@"Petrol"
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
           // [self presentViewController:alert animated:YES completion:nil];
           [self performSegueWithIdentifier:@"callStations" sender:nil];
        }
        if(_sgmGasType.selectedSegmentIndex == 1){
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Test"
                                          message:@"Unleaded"
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
           // [self presentViewController:alert animated:YES completion:nil];
           [self performSegueWithIdentifier:@"callStations" sender:nil];
        }
        if(_sgmGasType.selectedSegmentIndex == 2){
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Test"
                                          message:@"Gas"
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
           // [self presentViewController:alert animated:YES completion:nil];
           [self performSegueWithIdentifier:@"callStations" sender:nil];
        }
        if(_sgmGasType.selectedSegmentIndex == 3){
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Test"
                                          message:@"Diesel"
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
          //  [self presentViewController:alert animated:YES completion:nil];
           [self performSegueWithIdentifier:@"callStations" sender:nil];
        }
       
   
    }
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
