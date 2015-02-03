//
//  ActivityStreamService.h
//  ActivityStream
//
//  Created by David Karlsson on 02/02/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActivityStreamObject.h"

@class ActivityStreamService;

@protocol ActivityStreamServiceDelegate <NSObject>

- (void) modelUpdated;

@end

@interface ActivityStreamService : NSObject

@property (nonatomic, weak) id<ActivityStreamServiceDelegate> delegate;


- (NSArray*) streamObjects;
-(void)set:(ActivityStreamObject*)object;
//-(id)get:(NSInteger*)objectId;
-(void)getAll;


@end
