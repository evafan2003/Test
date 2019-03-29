//
//  ThreadViewController.m
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //make an array
    _arr = [NSMutableArray arrayWithArray:@[@"92",@"76",@"123",@"8",@"38",@"55",@"23",@"43"]];
    
    _array = @[@"92",@"76",@"123",@[@"z",@"y",@"x",@[@"6",@"6",@"6",@"6",@"6"],@"v",@"u",@"q",],@"38",@"55",@"23",@"43",@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",]];
    
//    dispatch_sync(dispatch_queue_create("queue", NULL), ^{
//        NSLog(@"123");
//    });
//    NSLog(@"456");
    
    
//    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
//    dispatch_source_set_timer(source, DISPATCH_TIME_NOW, 2.0*NSEC_PER_SEC, 0*NSEC_PER_SEC);
//    dispatch_source_set_event_handler(source, ^{
//        NSLog(@"dispatch_source_t");
//    });
//    dispatch_resume(source);
    
    [self maxConcurrent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)threadstart:(id)sender {
    //实例化一个 NSThread对象
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(longOperation:)object:@"NSThread"];
    [t1 setName:@"new thread"];
    
    NSThread *t2 = [NSThread mainThread];
    double a = [t1 threadPriority];
    NSLog(@"%f",a);
    if ([t2 isMainThread]) {
        
        NSLog(@"is main thread");
    } else {
        NSLog(@"not a main thread");
    }
    
    
    //厕所排序
    //实例化一个 NSThread对象
    NSThread *sort = [[NSThread alloc]initWithTarget:self selector:@selector(longOperation:)object:_arr];
    [sort setName:@"insert sort"];
    // 启动线程
    [sort start];
    
    //    [self performSelector:@selector(longOperation:) withObject:@"NSThread"];
}

- (void)longOperation:(id)obj {
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%@ %d -- %@", [NSThread currentThread], i, obj);
        if(i==5){
            //            [NSThread sleepForTimeInterval:3];
        }
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//用信号量控制并发数
-(void) maxConcurrent {

    dispatch_semaphore_t semaphre = dispatch_semaphore_create(3);
    
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index){
        dispatch_semaphore_wait(semaphre, DISPATCH_TIME_FOREVER);
        sleep(2);
        NSLog(@"%@", [NSString stringWithFormat:@"-------- %zu  thread : %@",index,[NSThread currentThread]]);
        dispatch_semaphore_signal(semaphre);
    });
}

@end
