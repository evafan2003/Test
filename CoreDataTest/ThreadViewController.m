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
    NSLog(@" ");
    NSLog(@"this is a thread test ~~~~");
    NSLog(@" ");
    //make an array
    _arr = [NSMutableArray arrayWithArray:@[@"92",@"76",@"123",@"8",@"38",@"55",@"23",@"43"]];
    
    _array = @[@"92",@"76",@"123",@[@"z",@"y",@"x",@[@"6",@"6",@"6",@"6",@"6"],@"v",@"u",@"q",],@"38",@"55",@"23",@"43",@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",]];
    _dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"a",@"wa", nil];
    [self addObservation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)threadstart:(id)sender {
    NSLog(@"this is a thread test ~~~~");
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


//kvo和kvc的练习
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"nameXXX"])
        self.dictionary = value;
    if([key isEqualToString:@"ageXXX"])
        self.dictionary = value;
    else
        [super setValue:value forKey:key];
    
    [_array valueForKeyPath:@"name.capitalizedString"];
}

//kvo练习
- (void)removeObservation {
    [_dictionary removeObserver:self
                     forKeyPath:@"change"];
}

- (void)addObservation {
    [_dictionary addObserver:self forKeyPath:@"change"
                     options:0
                     context:(__bridge void*)self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ((__bridge id)context == self) {
        // 只处理跟我们当前class的property更新
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object
                               change:change context:context];
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

- (IBAction)threadStart:(id)sender {
//    [_dictionary setValue:@"1" forUndefinedKey:@"wa"];
//    [self setValue:[NSDictionary dictionary] forKey:@"dictionary"];
}
@end
