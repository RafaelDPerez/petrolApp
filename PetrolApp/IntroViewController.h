//
//  IntroViewController.h
//  PetrolApp
//
//  Created by Rafael Pérez on 5/24/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@import Firebase;

@interface IntroViewController : UIViewController<CLLocationManagerDelegate, UITextFieldDelegate>{

    NSArray *fuelCollection;
    
}

@property (strong, nonatomic)IBOutlet UILabel *lblselectedFuel;
@property (strong, nonatomic)IBOutlet UITextField *txtLocation;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sgmGasType;
-(IBAction)findStations:(id)sender;


@end
