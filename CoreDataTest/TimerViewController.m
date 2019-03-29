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
    
    CADisplayLink *link;
    BOOL stop;
    dispatch_source_t gcdTimer;
    
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
    stop = NO;
    
}


-(void) fire {
    NSLog(@"fire----------------");
}

//第二种方法

-(void) dealloc {
    NSLog(@"dealloc");
    
//    [_timer invalidate];
}


- (IBAction)NSTimerActive:(id)sender {
    
    if (stop) {
        [_timer invalidate];
        NSLog(@"NSTimer stop");
    } else {
    
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
    stop = !stop;
}

- (IBAction)CADisplayLinkActive:(id)sender {
    
    if (stop) {
        [link invalidate];
        NSLog(@"CADisplayTimer stop");
    } else {
        link = [CADisplayLink displayLinkWithTarget:self selector:@selector(fire)];
        link.frameInterval = 60;//设置间隔的frameInterval属性，其决定于屏幕刷新多少帧时调用一次该方法，默认为1，即1/60秒调用一次
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    stop = !stop;
}

- (IBAction)GCDActive:(id)sender {
    
    if (stop) {
        dispatch_suspend(gcdTimer);
        NSLog(@"gcd timer stop");
    } else {
        
        /** 创建定时器对象
         * para1: DISPATCH_SOURCE_TYPE_TIMER 为定时器类型
         * para2-3: 中间两个参数对定时器无用
         * para4: 最后为在什么调度队列中使用
         */
        gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0,0,dispatch_get_global_queue(0, 0));
        /** 设置定时器
         * para2: 任务开始时间
         * para3: 任务的间隔
         * para4: 可接受的误差时间，设置0即不允许出现误差
         * Tips: 单位均为纳秒
         */
        dispatch_source_set_timer(gcdTimer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
        
        /** 设置定时器任务
         * 可以通过block方式
         * 也可以通过C函数方式
         */
        dispatch_source_set_event_handler(gcdTimer, ^{
            NSLog(@"gcd fire");
//            NSLog(@"%@", [NSThread currentThread]);
        });
        dispatch_resume(gcdTimer);
    }
    stop = !stop;
}
@end
