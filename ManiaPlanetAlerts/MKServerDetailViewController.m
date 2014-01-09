//
//  MKServerDetailViewController.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/6/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKServerDetailViewController.h"
#import "NSString+MKFormat.h"

@interface MKServerDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gtitle;
@property (weak, nonatomic) IBOutlet UILabel *players;
@property (weak, nonatomic) IBOutlet UILabel *ladder;
@property (weak, nonatomic) IBOutlet UILabel *avgpts;
@property (weak, nonatomic) IBOutlet UILabel *medpts;
@property (weak, nonatomic) IBOutlet UIButton *owner;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end

@implementation MKServerDetailViewController

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
    self.name.attributedText = self.serv.titleText;
    self.gtitle.text = [NSString stringWithFormat:@"%@, %@", self.serv.online ? @"Online" : @"Offline", self.serv.private ? @"Private" : @"Public"];
    self.players.text = [NSString stringWithFormat:@"Players: %@/%@", self.serv.playercount, self.serv.maxplayercount];
    self.ladder.text = [NSString stringWithFormat:@"Ladder: %@-%@", self.serv.pointsmin, self.serv.pointsmax];
    self.avgpts.text = [NSString stringWithFormat:@"Average rank: %@", self.serv.avgplpoints];
    self.medpts.text = [NSString stringWithFormat:@"Median rank: %@", self.serv.avgplpoints]; //add median calc
    [self.owner setAttributedTitle:[self.serv.owner colorizeManiaString] forState:UIControlStateNormal];
    self.desc.text = self.serv.desc;    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
