
//
//  CalculatorMaker.m
//  CoreDataTest
//
//  Created by fei he on 2019/3/28.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

- (CalculatorMaker *(^)(int))add {
    return ^(int num){
        self.result += num;
        return self;
    };
}

- (CalculatorMaker *(^)(int))sub {
    return ^(int num){
        self.result -= num;
        return self;
    };
}

- (CalculatorMaker *(^)(int))multi {
    return ^(int num){
        self.result *= num;
        return self;
    };
}

- (CalculatorMaker *(^)(int))divide {
    return ^(int num){
        self.result /= num;
        return self;
    };
}

@end
