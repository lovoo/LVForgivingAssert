//
//  LVClassToTest.m
//  LVForgivableAssert
//
//  Created by Benjamin Herzog on 02.05.16.
//  Copyright © 2016 Benjamin Herzog. All rights reserved.
//

#import "LVClassToTest.h"

@implementation LVClassToTest

+ (BOOL)methodThatAsserts:(NSString *)parameterThatCouldBeNil
{
    NSAssert(parameterThatCouldBeNil, @"I assume that the parameter is not nil, but Objective-C has no Optional type to ensure this, so I assert in debug mode.");
    
    // In debug, we are done here if parameter is nil and are free to use the parameter.
    // But in release mode, the NSAssert does nothing so it might crash. We want to test the release configuration as well!
    
    if (parameterThatCouldBeNil == nil) {
        return NO;
    }
    
    return YES;
}

@end
