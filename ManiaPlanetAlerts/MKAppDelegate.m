//
//  MKAppDelegate.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/3/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKAppDelegate.h"
#import "MKTabViewController.h"
#import "MKAccViewController.h"
#import "MKServerLocationViewController.h"

@implementation MKAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSError *error = nil;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ManiaPlanetAlerts" ofType:@"momd"]];

    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    // Initialize the Core Data stack
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSPersistentStore __unused *persistentStore = [managedObjectStore addInMemoryPersistentStore:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    [managedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"https://ws.maniaplanet.com"]];
    objectManager.managedObjectStore = managedObjectStore;
    [objectManager.HTTPClient setAuthorizationHeaderWithUsername:@"diablohorse|diablo23q" password:@"msuobjc"];
    
    [RKObjectManager setSharedManager:objectManager];
    
    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:@"Server" inManagedObjectStore:managedObjectStore];
    [entityMapping addAttributeMappingsFromDictionary:@{
                                                        @"id":              @"id",
                                                        @"ladderPointsAvg": @"avgplpoints",
                                                        @"maxPlayerCount":  @"maxplayercount",
                                                        @"playerCount":     @"playercount",
                                                        @"ladderLimitMax":  @"pointsmax",
                                                        @"ladderLimitMin":  @"pointsmin",
                                                        @"description":     @"desc",
                                                        @"serverName":      @"name",
                                                        @"owner":           @"owner",
                                                        @"isOnline":        @"online",
                                                        @"isPrivate":       @"private"}];
    entityMapping.identificationAttributes = @[ @"id" ];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:entityMapping method:RKRequestMethodGET pathPattern:@"/servers/" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    // Override point for customization after application launch.
    MKTabViewController *mainController = [[MKTabViewController alloc] initWithNibName:@"MKTabViewController" bundle:nil];
    self.window.rootViewController = mainController;
    
    UIViewController *acc=[[MKAccViewController alloc] initWithNibName:@"MKAccViewController" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:acc];
    MKServerLocationViewController *serv = [[MKServerLocationViewController alloc] initWithNibName:@"MKServerLocationViewController" bundle:nil];
    serv.managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    UINavigationController *servNav = [[UINavigationController alloc] initWithRootViewController:serv];
    servNav.navigationBar.translucent = NO;
    self.navController.navigationBar.translucent = NO;
    mainController.tabBar.translucent = NO;
    [self.navController setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Accounts" image:nil tag:0]];
    [servNav setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Titles" image:nil tag:1]];
    
    [mainController setViewControllers:@[self.navController, servNav]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Clear NSUserDefaults
    //NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    //[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
}


@end
