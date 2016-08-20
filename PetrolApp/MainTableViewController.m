//
//  MainTableViewController.m
//  PetrolApp
//
//  Created by Rafael Pérez on 5/9/16.
//  Copyright © 2016 Rafael Pérez. All rights reserved.
//

#import "MainTableViewController.h"
#import "Station.h"
#import "StationCell.h"
#import "StationViewController.h"


@interface MainTableViewController ()

@end

@implementation MainTableViewController
@synthesize stationsArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    FIRDatabaseReference *rootRef= [[FIRDatabase database] reference];
    stationsArray = [[NSMutableArray alloc] init];
    [[rootRef child:@"stations"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        for ( FIRDataSnapshot *child in snapshot.children) {
            
          //  NSLog(@"child.value = %@",child.value[@"station_name"]);
            Station *station = [[Station alloc]init];
            station.Name = child.value[@"station_name"];
            station.Longitude = child.value[@"station_longitude"];
            station.Latitude = child.value[@"station_latitude"];
            station.waitTime = child.value[@"station_wait_time"];
            station.gasQuantity = child.value[@"station_gas_quantity"];
            station.Rating = child.value[@"station_rating"];
            station.Logo = child.value[@"station_logo"];
            [stationsArray addObject:station];
            
             [self.tableView reloadData];
               NSLog(@"hay : %lu",(unsigned long)[stationsArray count]);
        }

    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    NSLog(@"%lu",(unsigned long)[stationsArray count]);
    
    
//    station1.Name = @"AP Filling Station";
//    station1.Longitude = @"6.469438";
//    station1.Latitude = @"3.578921";
//    station1.waitTime = @"0.6";
//    station1.gasQuantity = @"0.22";
//    station1.Rating = @"4.5";
//    
//    Station *station2 = [[Station alloc]init];
//    station2.Name = @"AP Filling Station";
//    station2.Longitude = @"6.469438";
//    station2.Latitude = @"3.578921";
//    station2.waitTime = @"1.0";
//    station2.gasQuantity = @"0.5";
//    station2.Rating = @"1";
//    
//    Station *station3 = [[Station alloc]init];
//    station3.Name = @"AP Filling Station";
//    station3.Longitude = @"6.469438";
//    station3.Latitude = @"3.578921";
//    station3.waitTime = @"0.2";
//    station3.gasQuantity = @"0.75";
//    station3.Rating = @"3";
//    
//    Station *station4 = [[Station alloc]init];
//    station4.Name = @"Mobil";
//    station4.Longitude = @"6.469438";
//    station4.Latitude = @"3.578921";
//    station4.waitTime = @"0.0";
//    station4.gasQuantity = @"1.0";
//    station4.Rating = @"5";
//    
//    Station *station5 = [[Station alloc]init];
//    station5.Name = @"AP Filling Station";
//    station5.Longitude = @"6.469438";
//    station5.Latitude = @"3.578921";
//    station5.waitTime = @"0.6";
//    station5.gasQuantity = @"0.9";
//    station5.Rating = @"0";
//    
//    Station *station6 = [[Station alloc]init];
//    station6.Name = @"Mrs Filling Station";
//    station6.Longitude = @"6.469438";
//    station6.Latitude = @"3.578921";
//    station6.waitTime = @"0.6";
//    station6.gasQuantity = @"0.9";
//    station6.Rating = @"4.5";
//    
//    Station *station7 = [[Station alloc]init];
//    station7.Name = @"AP Filling Station";
//    station7.Longitude = @"6.469438";
//    station7.Latitude = @"3.578921";
//    station7.waitTime = @"0.6";
//    station7.gasQuantity = @"0.9";
//    station7.Rating = @"1";
//    
//    [stationsArray addObject:station1];
//    [stationsArray addObject:station2];
//    [stationsArray addObject:station3];
//    [stationsArray addObject:station4];
//    [stationsArray addObject:station5];
//    [stationsArray addObject:station6];
//    [stationsArray addObject:station7];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [stationsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"StationCell";
    //    StationCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    StationCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    Station *station;
    if (!cell) {
        cell = [[StationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
//    if(tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        cell= [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//        //station = [filteredguestArray objectAtIndex:indexPath.row];
//    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
        station = [stationsArray objectAtIndex:indexPath.row];
        
    }
    
    //    cell.stationName.text = station.Name;
    //    cell.stationAddress.text = station.Name;
    
    if ([station.gasQuantity floatValue] > 0 && [station.gasQuantity floatValue] < 0.25f)
        cell.gasQuantity.progressTintColor = [UIColor redColor];
    if ([station.gasQuantity floatValue] >= 0.25f && [station.gasQuantity floatValue] < 0.75f)
        cell.gasQuantity.progressTintColor = [UIColor blueColor];
    if ([station.gasQuantity floatValue] >= 0.75f)
        cell.gasQuantity.progressTintColor = [UIColor greenColor];
    
    if ([station.waitTime floatValue] > 0 && [station.waitTime floatValue] < 0.25f)
        cell.waitTime.progressTintColor = [UIColor redColor];
    if ([station.waitTime floatValue] >= 0.25f && [station.waitTime floatValue] < 0.75f)
        cell.waitTime.progressTintColor = [UIColor blueColor];
    if ([station.waitTime floatValue] >= 0.75f)
        cell.waitTime.progressTintColor = [UIColor greenColor];
    
    cell.stationName.text = station.Name;
    cell.stationAddress.text = station.Name;
    cell.gasQuantity.progress = [station.gasQuantity floatValue];
    cell.waitTime.progress = [station.waitTime floatValue];
//    NSURL *imageURL = [NSURL URLWithString:station.Logo];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // Update the UI
//            cell.stationLogo.image = [UIImage imageWithData:imageData];
//        });
//    });

    cell.waitTimepctg.text =  [NSString stringWithFormat:@"%.f%%", [station.waitTime floatValue]*100];
    cell.gasQuantitypctg.text = station.gasQuantity;
    cell.staticStarRatingView.canEdit = NO;
    cell.staticStarRatingView.maxRating = 5;
    cell.staticStarRatingView.rating = [station.Rating floatValue];
    
    return cell;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ViewStation"]) {
            NSIndexPath *indexPaths = [self.tableView indexPathForSelectedRow];
            StationViewController *stationViewController = [segue destinationViewController];
            _selectedStation = [stationsArray objectAtIndex:indexPaths.row];
            stationViewController.Station = _selectedStation;
            [self.tableView deselectRowAtIndexPath:indexPaths animated:NO];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
