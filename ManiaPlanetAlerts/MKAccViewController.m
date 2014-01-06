//
//  MKAccViewController.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/3/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKAccViewController.h"

@interface MKAccViewController ()
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *maniaButton;
@end

@implementation MKAccViewController

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
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if([defaults stringForKey:@"ManiaAccessToken"] != nil) {
        [self.maniaButton setTitle:@"ManiaPlanet (Authorized)" forState:UIControlStateNormal];
    }
    if([defaults stringForKey:@"TwitterAccessToken"] != nil) {
        [self.maniaButton setTitle:@"Twitter (Authorized)" forState:UIControlStateNormal];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)maniaAuth:(id)sender {
    MKManiaAuthViewController *sec=[[MKManiaAuthViewController alloc] initWithNibName:@"MKManiaAuthViewController" bundle:nil];
    sec.delegate = self;
    [self.navigationController pushViewController:sec animated:YES];
}

- (IBAction)twitterAuth:(id)sender {
    MKTwitterAuthViewController *sec=[[MKTwitterAuthViewController alloc] initWithNibName:@"MKTwitterAuthViewController" bundle:nil];
    sec.delegate = self;
    [self.navigationController pushViewController:sec animated:YES];
}

-(void)authSuccess:(BOOL)succ withToken:(NSString *)token forService: (NSString *) service
{
    if (succ) {
        if ([service isEqualToString:@"Mania"]) {
            [self.maniaButton setTitle:@"ManiaPlanet (Authorized)" forState:UIControlStateNormal];
        }
        if ([service isEqualToString:@"Twitter"]) {
            [self.maniaButton setTitle:@"Twitter (Authorized)" forState:UIControlStateNormal];
        }
    }
}

@end
