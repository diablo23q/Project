//
//  MKServer.h
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/6/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MKServer : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * owner;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSNumber * online;
@property (nonatomic, retain) NSNumber * playercount;
@property (nonatomic, retain) NSNumber * maxplayercount;
@property (nonatomic, retain) NSNumber * pointsmax;
@property (nonatomic, retain) NSNumber * pointsmin;
@property (nonatomic, retain) NSNumber * private;
@property (nonatomic, retain) NSNumber * avgplpoints;
@property (nonatomic, retain) NSSet *maps;
@property (nonatomic, retain) NSManagedObject *title;
@property (nonatomic, retain) NSManagedObject *szone;
@property (nonatomic, retain) NSSet *players;

@property (nonatomic, readonly) NSString *titleText;
@property (nonatomic, readonly) NSString *subtitleText;
@end

@interface MKServer (CoreDataGeneratedAccessors)

- (void)addMapsObject:(NSManagedObject *)value;
- (void)removeMapsObject:(NSManagedObject *)value;
- (void)addMaps:(NSSet *)values;
- (void)removeMaps:(NSSet *)values;

- (void)addPlayersObject:(NSManagedObject *)value;
- (void)removePlayersObject:(NSManagedObject *)value;
- (void)addPlayers:(NSSet *)values;
- (void)removePlayers:(NSSet *)values;

@end
