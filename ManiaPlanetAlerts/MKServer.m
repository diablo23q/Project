//
//  MKServer.m
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/6/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import "MKServer.h"


@implementation MKServer

@dynamic id;
@dynamic name;
@dynamic owner;
@dynamic desc;
@dynamic online;
@dynamic playercount;
@dynamic maxplayercount;
@dynamic pointsmax;
@dynamic pointsmin;
@dynamic private;
@dynamic avgplpoints;
@dynamic maps;
@dynamic title;
@dynamic szone;
@dynamic players;

- (NSString *)titleText
{
    return self.name;
}

- (NSString *)subtitleText
{
    return [NSString stringWithFormat:@"%@ Players: %@/%@. Ladder: %@-%@", self.online ? @"Online." : @"Offline.",
            self.playercount, self.maxplayercount, self.pointsmin, self.pointsmax];
}

@end
