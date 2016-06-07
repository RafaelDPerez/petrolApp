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

@interface MainTableViewController ()

@end

@implementation MainTableViewController
@synthesize stationsArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    stationsArray = [[NSMutableArray alloc] init];
    Station *station1 = [[Station alloc]init];
    station1.Name = @"AP Filling Station";
    station1.Longitude = @"6.469438";
    station1.Latitude = @"3.578921";
    Station *station2 = [[Station alloc]init];
    station2.Name = @"AP Filling Station";
    station2.Longitude = @"6.469438";
    station2.Latitude = @"3.578921";
    Station *station3 = [[Station alloc]init];
    station3.Name = @"AP Filling Station";
    station3.Longitude = @"6.469438";
    station3.Latitude = @"3.578921";
    Station *station4 = [[Station alloc]init];
    station4.Name = @"Mobil";
    station4.Longitude = @"6.469438";
    station4.Latitude = @"3.578921";
    Station *station5 = [[Station alloc]init];
    station5.Name = @"AP Filling Station";
    station5.Longitude = @"6.469438";
    station5.Latitude = @"3.578921";
    Station *station6 = [[Station alloc]init];
    station6.Name = @"Mrs Filling Station";
    station6.Longitude = @"6.469438";
    station6.Latitude = @"3.578921";
    Station *station7 = [[Station alloc]init];
    station7.Name = @"AP Filling Station";
    station7.Longitude = @"6.469438";
    station7.Latitude = @"3.578921";
    [stationsArray addObject:station1];
    [stationsArray addObject:station2];
    [stationsArray addObject:station3];
    [stationsArray addObject:station4];
    [stationsArray addObject:station5];
    [stationsArray addObject:station6];
    [stationsArray addObject:station7];

    
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
    
    cell.stationName.text = station.Name;
    cell.stationAddress.text = station.Name;
    cell.staticStarRatingView.canEdit = NO;
    cell.staticStarRatingView.maxRating = 5;
    cell.staticStarRatingView.rating = 1.5;
    
    return cell;

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
