//
//  NSTimer+CustomTimer.m
//  CoreDataTest
//
//  Created by fei he on 2019/3/6.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import "NSTimer+CustomTimer.h"

@implementation NSTimer (CustomTimer)

+ (NSTimer *)he_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(handle:) userInfo:block repeats:repeats];
}

+(void) handle:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
