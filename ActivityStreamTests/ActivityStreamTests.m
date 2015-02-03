//
//  ActivityStreamTests.m
//  ActivityStreamTests
//
//  Created by David Karlsson on 30/01/15.
//  Copyright (c) 2015 David Karlsson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ActivityStreamService.h"
#import "ActivityStreamObject.h"

@interface ActivityStreamTests : XCTestCase

@end

@implementation ActivityStreamTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
   /* ActivityStreamObject* streamObject = [[ActivityStreamObject alloc] initWithData:@"testVerb" actor:@"testActor" object:@"testObject"];
    
    ActivityStreamService* activityStreamService = [[ActivityStreamService alloc] init];
    [activityStreamService set:streamObject];
    

*/
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
