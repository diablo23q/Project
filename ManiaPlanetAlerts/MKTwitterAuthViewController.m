//
//  MKTwitterAuthViewController.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/6/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKTwitterAuthViewController.h"

@interface MKTwitterAuthViewController ()
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation MKTwitterAuthViewController

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
	// Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    NSURL *target = [[NSURL alloc] initWithString:@"https://api.twitter.com/oauth2/token?grant_type=client_credentials"];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:target];
    [req setValue:@"Basic Y3dEM3FNUjZBeHJtSlBUWThhbzlRdzpkMTB1cHpUMjNzcG9yMGpoTGVRRUNYQlNYVGJMRkFZR0dSN3NIbDQ1dXBn" forHTTPHeaderField:@"Authorization"];
    [req setHTTPMethod:@"POST"];
    [req setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [self.webView loadRequest:req];
    
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
        [defaults setObject:accessToken forKey:@"TwitterAccessToken"];
        [defaults synchronize];
        
        [self.delegate authSuccess:YES withToken:accessToken forService:@"Twitter"];
        [self.navigationController popViewControllerAnimated:NO];
    }
    
    return YES;
}

@end
