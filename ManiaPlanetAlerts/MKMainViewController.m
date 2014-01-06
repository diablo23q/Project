//
//  MKMainViewController.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/3/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKMainViewController.h"
#import "MKAccViewController.h"

@interface MKMainViewController ()

@end

@implementation MKMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)accounts:(id)sender {
    UIViewController *sec=[[MKAccViewController alloc] initWithNibName:@"MKAccViewController" bundle:nil];
    [self.navigationController pushViewController:sec animated:YES];
}

- (IBAction)notifications:(id)sender {
    
}


@end
