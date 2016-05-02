//
//  LVForgivingAssertionHandler.m
//  LOVOO
//
//  Created by Benjamin Herzog on 27.04.16.
//  Copyright © 2016 LOVOO GmbH. All rights reserved.
//

#import "LVForgivingAssertionHandler.h"

@implementation LVForgivingAssertionHandler

-(void)handleFailureInMethod:(SEL)selector object:(id)object file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format, ...
{
    // intentionally left empty
}

-(void)handleFailureInFunction:(NSString *)functionName file:(NSString *)fileName lineNumber:(NSInteger)line description:(NSString *)format, ...
{
    // intentionally left empty
}

@end