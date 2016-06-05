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


-(Station *) InitWithDictionary: (NSDictionary*) Dict;
@end
