//
//  AppDelegate.h
//  ActivityStream
//
//  Created by David Karlsson on 30/01/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityStreamService.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** Singleton data model */
@property (strong, nonatomic) ActivityStreamService* activityStreamService;

+ (AppDelegate *)appDelegate;
@end

