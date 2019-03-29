//
//  TimerProxy.m
//  CoreDataTest
//
//  Created by fei he on 2019/3/6.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import "TimerProxy.h"

@implementation TimerProxy

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
