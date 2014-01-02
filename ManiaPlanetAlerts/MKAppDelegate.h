//
//  MKAppDelegate.h
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/3/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
