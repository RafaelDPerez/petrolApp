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
    
    _starsRating.canEdit = YES;
    _starsRating.maxRating = 5;
    _starsRating.rating = [self.Station.Rating floatValue];
    _lblStationName.text = self.Station.Name;
    _sldWaitTime.maximumValue = 1;
    _sldGasQuantity.maximumValue = 1;
    [_sldGasQuantity setValue:[self.Station.gasQuantity floatValue]];
    [_sldWaitTime setValue:[self.Station.waitTime floatValue]];
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
