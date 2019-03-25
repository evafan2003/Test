//
//  TimerViewController.m
//  CoreDataTest
//
//  Created by fei he on 2019/3/6.
//  Copyright © 2019年 com.mosh. All rights reserved.
//  1 调用didMoveToParentViewController方法
//  2 引入一个中间者 然后将timer执行的方法与中间者绑定
//  3 NSProxy
//  4 NSTimer block
//  5 NSTimer 分类

#import <objc/runtime.h>
#import "TimerViewController.h"
#import "TimerProxy.h"
#import "NSTimer+CustomTimer.h"

@interface TimerViewController () {
    NSTimer *_timer;
    id _target;
    TimerProxy *proxy;
}

@end

@implementation TimerViewController



//第一种方法 返回父级vc时候调用
-(void) didMoveToParentViewController:(UIViewController *)parent {
    //在这里
//    if (!parent) {
//        [_timer invalidate];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //方法2
//    _target = [NSObject new];
//    class_addMethod([_target class], @selector(fire), class_getMethodImplementation([self class], @selector(fire)), "v@:");
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:_target selector:@selector(fire) userInfo:nil repeats:YES];
//
    
    //方法3
//    proxy = [TimerProxy alloc];
//    proxy.target = self;
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(fire) userInfo:nil repeats:YES];
//
    
    //方法4
//    __weak typeof (self) weakSelf = self;
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer){
//        [weakSelf fire];
//    }];
    
    
    //方法5
    __weak typeof (self) weakSelf = self;
    _timer = [NSTimer he_scheduledTimerWithTimeInterval:1 repeats:YES block:^{
        [weakSelf fire];
    }];
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fire) userInfo:nil repeats:YES];
//    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(fire) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
//    [_timer fire];
}


-(void) fire {
    NSLog(@"fire----------------");
}

//第二种方法

-(void) dealloc {
    NSLog(@"dealloc");
    
//    [_timer invalidate];
}

@end
