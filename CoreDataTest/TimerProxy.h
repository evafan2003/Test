//
//  TimerProxy.h
//  CoreDataTest
//
//  Created by fei he on 2019/3/6.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy

@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
