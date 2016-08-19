//
//  Station.h
//  PetrolApp
//
//  Created by Rafael Pérez on 4/30/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Station : NSObject
@property (strong,nonatomic) NSString *Id;
@property (strong,nonatomic) NSString *Name;
@property (strong,nonatomic) NSString *Latitude;
@property (strong,nonatomic) NSString *Longitude;
@property (strong,nonatomic) NSString *waitTime;
@property (strong,nonatomic) NSString *gasQuantity;
@property (strong,nonatomic) NSString *Distance;
@property (strong,nonatomic) NSString *Rating;
@property (strong,nonatomic) NSString *Logo;





-(Station *) InitWithDictionary: (NSDictionary*) Dict;
@end
