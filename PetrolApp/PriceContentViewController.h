//
//  PriceContentViewController.h
//  PetrolApp
//
//  Created by Rafael Perez on 8/9/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Station.h"

@interface PriceContentViewController : UIViewController
@property(strong,nonatomic) Station *Station;
@property(strong,nonatomic) IBOutlet UISlider *sldWaitTime;
@end
