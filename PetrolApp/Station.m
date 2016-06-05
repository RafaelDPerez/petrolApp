//
//  Station.m
//  PetrolApp
//
//  Created by Rafael Pérez on 4/30/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "Station.h"

@implementation Station
-(Station*) InitWithDictionary: (NSDictionary*) Dict;
{
    
    if([Dict objectForKey:@"id"] != [NSNull null])
        self.Id = [Dict objectForKey:@"id"];
    if([Dict objectForKey:@"name"] != [NSNull null])
        self.Name = [Dict objectForKey:@"name"];
    if([Dict objectForKey:@"longitude"] != [NSNull null])
        self.Latitude = [Dict objectForKey:@"longitude"];
    if([Dict objectForKey:@"latitude"] != [NSNull null])
        self.Longitude = [Dict objectForKey:@"latitude"];
    
    
    
    return self;
}

@end
