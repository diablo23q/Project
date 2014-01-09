//
//  MKServerLocationViewController.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/9/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKServerLocationViewController.h"
#import "MKServerMasterViewController.h"

@interface MKServerLocationViewController ()
@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSArray *subtitles;
@end

@implementation MKServerLocationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titles = @[@"ShootMania Storm", @"ShootMania Royal", @"ShootMania Elite", @"TrackMania Canyon", @"TrackMania Stadium", @"TrackMania Valley"];
    self.subtitles = @[@"SMStorm", @"SMStormRoyal@nadeolabs", @"SMStormElite@nadeolabs", @"TMCanyon", @"TMStadium", @"TMValley"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"MKCell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.titles objectAtIndex:indexPath.item];
    cell.detailTextLabel.text = [self.subtitles objectAtIndex:indexPath.item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MKServerMasterViewController *masterViewController = [[MKServerMasterViewController alloc] initWithNibName:@"MKServerMasterViewController" bundle:nil];
    masterViewController.gameTitle = [self.subtitles objectAtIndex:indexPath.item];
    masterViewController.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:masterViewController animated:YES];
}

@end
