//
//  MKAuthProtocol.h
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/6/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthDelegate <NSObject>
- (void)authSuccess:(BOOL)succ withToken:(NSString *)token forService:(NSString *) service;
@end