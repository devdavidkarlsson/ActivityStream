//
//  ActivityStreamService.m
//  ActivityStream
//
//  Created by David Karlsson on 02/02/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import "ActivityStreamService.h"

NSString *const kBaseURL = @"http://10.4.25.16:3001/";
NSString *const kStreams =@"streams";


@interface ActivityStreamService ()
@property (strong, nonatomic) NSMutableArray *objects;
@end

@implementation ActivityStreamService

- (id)init
{
    self = [super init];
    if (self) {
        _objects = [NSMutableArray array];
    }
    return self;
}

- (NSArray*) streamObjects
{
    return [self objects];
}


-(void)set:(ActivityStreamObject*)object{
    
    
    if (!object || object.actor == nil || object.actor.length == 0) {
        return; //input safety check
    }
    
    
    NSString* streamURL = [kBaseURL stringByAppendingPathComponent:kStreams];
    
    BOOL isExistingLocation = object._id != nil;
    
    NSURL* url = isExistingLocation ? [NSURL URLWithString:[streamURL stringByAppendingPathComponent:object._id]] :
    [NSURL URLWithString:streamURL];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = isExistingLocation ? @"PUT" : @"POST";
    
    NSData* data = [NSJSONSerialization dataWithJSONObject:[object toDictionary] options:0 error:NULL];
    request.HTTPBody = data;
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { //5
        if (!error) {
            NSArray* responseArray = @[[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]];
            [self parseAndAddLocations:responseArray toArray:self.objects];
        }
    }];
    [dataTask resume];

    
}

-(void)getAll{
    NSURL* url = [NSURL URLWithString:[kBaseURL stringByAppendingPathComponent:kStreams]];
    
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET"; //2
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSArray* responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

            [self.objects removeAllObjects];
            [self parseAndAddLocations:responseArray toArray:self.objects];
        }else{
            NSLog(@"GOT NILL");
            NSLog(@"%@",error.description);
        }
    }];
    
    [dataTask resume];
    
}

- (void)parseAndAddLocations:(NSArray*)objects toArray:(NSMutableArray*)destinationArray
{
    for (NSDictionary* item in objects) {
        ActivityStreamObject* object = [[ActivityStreamObject alloc] initWithDictionary:item];
        [destinationArray addObject:object];
    }
    if (self.delegate) {
        
        [self.delegate modelUpdated];
    }
}
@end


