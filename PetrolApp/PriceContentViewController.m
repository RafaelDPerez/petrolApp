//
//  PriceContentViewController.m
//  PetrolApp
//
//  Created by Rafael Perez on 8/9/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "PriceContentViewController.h"

@interface PriceContentViewController ()

@end

@implementation PriceContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
