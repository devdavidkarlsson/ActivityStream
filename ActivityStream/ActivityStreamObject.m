//
//  ActivityStreamObject.m
//  ActivityStream
//
//  Created by David Karlsson on 02/02/15.
//  Minimal Acticity Stream Object:
//
// {
//  "verb": "post",
//  "actor": "urn:example:person:martin",
//  "object": "http://example.org/foo.jpg"
// }
//
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActivityStreamObject.h"



@interface ActivityStreamObject ()

@end


@implementation ActivityStreamObject
    

- (id) initWithData:(NSString*)verb actor:(NSString*)actor object:(NSString*)object{
    
        self = [super init];
        if (self){
            [self setVerb:verb];
            [self setActor:actor];
            [self setObject:object];
        }
        return self;
}

- (instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        self._id = dictionary[@"_id"];
        self.verb = dictionary[@"verb"];
        self.actor = dictionary[@"actor"];
        self.object = dictionary[@"object"];
    }
    return self;
}


#define safeSet(d,k,v) if (v) d[k] = v;
- (NSDictionary*) toDictionary
{
    NSMutableDictionary* jsonable = [NSMutableDictionary dictionary];
    safeSet(jsonable, @"_id", self._id);
    safeSet(jsonable, @"verb", self.verb);
    safeSet(jsonable, @"actor", self.actor);
    safeSet(jsonable, @"object", self.object);
    return jsonable;
}

- (NSString*) toString{
    return [NSString stringWithFormat:@"%@ %@ %@", self.actor, self.verb, self.object];
}



@end

