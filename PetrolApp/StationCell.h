//
//  StationCell.h
//  PetrolApp
//
//  Created by Rafael Pérez on 4/30/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *stationName;
@property (strong, nonatomic) IBOutlet UILabel *stationAddress;

@end
