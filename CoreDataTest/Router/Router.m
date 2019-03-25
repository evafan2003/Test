//
//  Router.m
//  CoreDataTest
//
//  Created by EMCC on 16/6/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "Router.h"

@implementation Router

+ (BOOL) isKindOfNSStringClassAndLenthGreaterThanZero:(NSString *)className {
    
    
    return YES;

}


+ (id) runtimeClass:(NSString *)className {

    if ([self isKindOfNSStringClassAndLenthGreaterThanZero:className]) {
        UIViewController *ctl = [[[NSClassFromString(className) class] alloc] init];
        return ctl;
    }
    return nil;
}

+ (UIViewController *) viewController:(NSString *)controllerName {
    if ([self isKindOfNSStringClassAndLenthGreaterThanZero:controllerName]) {
        UIViewController *ctl = [[NSClassFromString(controllerName) class] new];
        return ctl;
    }
    return nil;
}

@end
