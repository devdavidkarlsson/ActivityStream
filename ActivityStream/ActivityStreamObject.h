//
//  ActivityStreamObject.h
//  ActivityStream
//
//  Created by David Karlsson on 02/02/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#ifndef ActivityStream_ActivityStreamObject_h
#define ActivityStream_ActivityStreamObject_h

@interface ActivityStreamObject : NSObject

@property (nonatomic, copy) NSString* _id;
@property (nonatomic, copy) NSString *verb;
@property (nonatomic, copy) NSString *actor;
@property (nonatomic, copy) NSString *object;
    

- (id) initWithData:(NSString*)verb actor:(NSString*)actor object:(NSString*)object;
- (instancetype) initWithDictionary:(NSDictionary*)dictionary;
- (NSDictionary*) toDictionary;
- (NSString*) toString;
@end
#endif
