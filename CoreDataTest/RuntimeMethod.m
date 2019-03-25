//
//  RuntimeMethod.m
//  CoreDataTest
//
//  Created by EMCC on 16/6/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "RuntimeMethod.h"

@implementation RuntimeMethod

- (void) aaaa:(NSString *)firstStr bbbb:(NSString *)secondStr {
    
    NSLog(@"aaaa:%@,bbbb:%@",firstStr,secondStr);
}

- (void) stringmethod:(NSString *)firstStr intmethod:(int)secondInt {
    
    NSLog(@"aaaa:%@,bbbb:%d",firstStr,secondInt);
}

- (void) aaaa:(NSString *)firstStr bbbb:(NSString *)secondStr cccc:(NSString *)thirdStr{
    
    NSLog(@"aaaa:%@,bbbb:%@,cccc:%@",firstStr,secondStr,thirdStr);
}
@end
