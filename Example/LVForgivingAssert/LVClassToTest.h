//
//  LVClassToTest.h
//  LVForgivableAssert
//
//  Created by Benjamin Herzog on 02.05.16.
//  Copyright © 2016 Benjamin Herzog. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LVClassToTest : NSObject

+ (BOOL)methodThatAsserts:(NSString *)parameterThatCouldBeNil;

@end

NS_ASSUME_NONNULL_END
