//
//  Router.h
//  CoreDataTest
//
//  Created by EMCC on 16/6/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Router : NSObject

+ (UIViewController *) viewController:(NSString *)controllerName;
+ (id) runtimeClass:(NSString *)className;


@end
