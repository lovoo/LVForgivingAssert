//
//  LVForgivableAssertTests.m
//  LVForgivableAssertTests
//
//  Created by Benjamin Herzog on 05/02/2016.
//  Copyright (c) 2016 Benjamin Herzog. All rights reserved.
//

@import XCTest;
#import "LVClassToTest.h"
@import LVForgivingAssert;

@interface LVClassToTest_TestCase : XCTestCase

@end

@implementation LVClassToTest_TestCase

- (void)test_methodThatAsserts
{
    // first we test the right behaviour
    XCTAssertTrue([LVClassToTest methodThatAsserts:@"some string"]);
    
    // next, we force an assert exception and test this in debug configuration
    NSString *nilString;
    XCTAssertThrows([LVClassToTest methodThatAsserts:nilString]);
    
    // last, we test the behaviour in release environment without switching our configuration for the tests by ignoring the NSAssert
    LVIgnoreAssert(^{
        XCTAssertFalse([LVClassToTest methodThatAsserts:nilString]);
    });
    
    // after the macro the method throws as expected again
    XCTAssertThrows([LVClassToTest methodThatAsserts:nilString]);
}

@end

