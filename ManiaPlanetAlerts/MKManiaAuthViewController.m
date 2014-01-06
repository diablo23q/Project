//
//  MKManiaAuthViewController.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/5/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKManiaAuthViewController.h"

@interface MKManiaAuthViewController ()
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation MKManiaAuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    self.title = @"Authorization";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)viewDidAppear:(BOOL)animated
{
    NSURL *target = [[NSURL alloc] initWithString:@"https://ws.maniaplanet.com/oauth2/authorize/?client_id=diablohorse%7Cdiablo23q&redirect_uri=https%3A%2F%2F127.0.0.1&scope=offline&response_type=token"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:target]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Web view delegate

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    
    if ([request.URL.absoluteString rangeOfString:@"#"].location != NSNotFound) {
        NSString* params = [[request.URL.absoluteString componentsSeparatedByString:@"#"] objectAtIndex:1];
        NSString* paramAcc = [[params componentsSeparatedByString:@"&"] objectAtIndex:0];
        NSString* accessToken = [paramAcc stringByReplacingOccurrencesOfString:@"access_token=" withString:@""];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:accessToken forKey:@"ManiaAccessToken"];
        [defaults synchronize];
        
        [self.delegate authSuccess:YES withToken:accessToken forService:@"Mania"];
        [self.navigationController popViewControllerAnimated:NO];
    }
    
    return YES;
}

@end
