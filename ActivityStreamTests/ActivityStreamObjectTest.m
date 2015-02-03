//
//  ActivityStreamObject.m
//  ActivityStream
//
//  Created by David Karlsson on 02/02/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

//#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "ActivityStreamObject.h"
#import "ActivityStreamService.h"

@interface ActivityStreamObjectTest : XCTestCase{
    ActivityStreamObject* streamObject;
    ActivityStreamService* streamService;
}


@end

@implementation ActivityStreamObjectTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreate {
    // This tests creation of
   NSString* verb = @"poked";
    NSString* actor = @"the duck";
    NSString* object = @"the bear";

    
    streamObject = [[ActivityStreamObject alloc] initWithData:verb actor:actor object:object];
    XCTAssert([streamObject.verb isEqualToString:@"poked"], @"pass");
    XCTAssert([streamObject.actor isEqualToString:@"the duck"], @"pass");
    XCTAssert([streamObject.object isEqualToString:@"the bear"], @"pass");
}

-(void)testPost {
    NSString* verb = @"poked";
    NSString* actor = @"the duck";
    NSString* object = @"the bear";
    
    
    streamObject = [[ActivityStreamObject alloc] initWithData:verb actor:actor object:object];
    streamService = [[ActivityStreamService alloc] init];
    [streamService set:streamObject];

    XCTAssert([streamObject.verb isEqualToString:@"poked"], @"pass");
    XCTAssert([streamObject.actor isEqualToString:@"the duck"], @"pass");
    XCTAssert([streamObject.object isEqualToString:@"the bear"], @"pass");
}

/*- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}*/

@end
