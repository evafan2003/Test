//
//  FowardObject.m
//  CoreDataTest
//
//  Created by fei he on 2019/3/5.
//  Copyright © 2019年 com.mosh. All rights reserved.
//
#import <objc/runtime.h>
#import "FowardObject.h"


@implementation FowardObject

-(void) addTimer:(SEL)selector userInfo:(NSDictionary *)info {
    self.theSelector = selector;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:selector userInfo:info repeats:YES];
}

//+(void)aaaa {
//    NSLog(@"qqqq");
//}

void wocao(id self, SEL _cmd) {
    NSLog(@"bbbbbb");
}

void ssssss(id self, SEL _cmd) {
    NSLog(@"aaaaaa");
}

-(void) testMethod {
    NSLog(@"cccccc");
}


//动态方法决议
//+ (BOOL)resolveClassMethod:(SEL)sel {
//
//    if (sel == @selector(aaaa)) {
//        class_addMethod([self class], sel, (IMP)ssssss, "v@:");
//    }
//    return [super resolveClassMethod:sel];
//    
//}


+ (BOOL)resolveInstanceMethod:(SEL)sel {

    if (sel == @selector(testMethod)) {
        class_addMethod([self class], sel, class_getMethodImplementation([self class], sel), "v@:");
    } else if (sel == @selector(bbbb)) {
        class_addMethod([self class], sel, (IMP) wocao, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];

}


//方法重定向 指派一个target来响应selector
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == self.theSelector) {
        return self.target;
    }
    return [super forwardingTargetForSelector:aSelector];
}

//转发 封装一个方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature* signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        signature = [self methodSignatureForSelector:aSelector];
    }
    return signature;
}


-(void) forwardInvocation:(NSInvocation *)anInvocation {
    if ([self respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

-(void) dealloc {
    
}
@end
