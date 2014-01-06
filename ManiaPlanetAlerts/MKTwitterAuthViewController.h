//
//  MKTwitterAuthViewController.h
//  ManiaPlanetAlerts
//
//  Created by Администратор on 1/6/14.
//  Copyright (c) 2014 MSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKAuthProtocol.h"

@interface MKTwitterAuthViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic, weak) id <AuthDelegate> delegate;
@end
