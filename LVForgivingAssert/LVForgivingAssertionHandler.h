//
//  LVForgivingAssertionHandler.h
//  LOVOO
//
//  Created by Benjamin Herzog on 27.04.16.
//  Copyright © 2016 LOVOO GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#define LVIgnoreAssert(block, ...) NSAssertionHandler *currentHandler = [NSAssertionHandler currentHandler]; \
    LVForgivingAssertionHandler *newHandler = [[LVForgivingAssertionHandler alloc] init]; \
    [[[NSThread currentThread] threadDictionary] setValue:newHandler forKey:NSAssertionHandlerKey]; \
    if ((block)) { block(__VA_ARGS__); }; \
    [[[NSThread currentThread] threadDictionary] setValue:currentHandler forKey:NSAssertionHandlerKey];
#pragma clang diagnostic pop

/**
 * This is an very forgivable implementation of an NSAssertionHandler, it is so forgivable, it ignores every NSAssert
 * completely so you can test production code in a debug environment.
 *
 * Use it like the following example:
 *
 * LVIgnoreAssert(^(){
 *      XCTAssertNotNil([object someMethodThatThrowsInside:nil]);
 *  })
 *
 *  This creates an instance of the LVForgivingAssertionHandler and sets it as the current handler for every NSAssert
 *  that gets called. After the execution of the block the original assertion handler gets set as the current one to avoid
 *  side effects.
 */
@interface LVForgivingAssertionHandler : NSAssertionHandler

@end