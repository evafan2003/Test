//
//  CalculatorMaker.h
//  CoreDataTest
//
//  Created by fei he on 2019/3/28.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorMaker : NSObject

@property (nonatomic, assign) int result;
- (CalculatorMaker *(^)(int))add;
- (CalculatorMaker *(^)(int))sub;
- (CalculatorMaker *(^)(int))multi;
- (CalculatorMaker *(^)(int))divide;

@end

NS_ASSUME_NONNULL_END
