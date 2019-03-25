//
//  FowardObject.h
//  CoreDataTest
//
//  Created by fei he on 2019/3/5.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FowardObject : NSObject

@property (weak) id target;
@property SEL theSelector;

-(void) addTimer:(SEL)selector userInfo:(NSDictionary *)info;

+(void) aaaa;

-(void) bbbb;

-(void) testMethod;

@end

NS_ASSUME_NONNULL_END
