//
//  ViewController.m
//  CoreDataTest
//
//  Created by  evafan2003 on 16/3/31.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@" ");
    NSLog(@"this is a thread test ~~~~");
    NSLog(@" ");
    
    //make an array
    _arr = [NSMutableArray arrayWithArray:@[@"92",@"76",@"123",@"8",@"38",@"55",@"23",@"43"]];
    
    _array = @[@"92",@"76",@"123",@[@"z",@"y",@"x",@[@"6",@"6",@"6",@"6",@"6"],@"v",@"u",@"q",],@"38",@"55",@"23",@"43",@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",]];
    
    _age = @"28";
    
}

- (void)longOperation:(id)obj {
    for (int i = 0; i < 10; ++i) {
        NSLog(@"%@ %d -- %@", [NSThread currentThread], i, obj);
        if(i==5){
            //            [NSThread sleepForTimeInterval:3];
        }
    }
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
    NSThread *sort = [[NSThread alloc]initWithTarget:self selector:@selector(rabbit)object:_arr];
    [sort setName:@"insert sort"];
    // 启动线程
    [sort start];
    
    //    [self performSelector:@selector(longOperation:) withObject:@"NSThread"];
}

//------------------这是另外一个版本------------------------------------------


//快速排序
-(void)quickSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[NSMutableArray alloc] initWithArray:aData];
    [self quickSortWithArray:data left:0 right:[aData count]-1];
    NSLog(@"快速排序后的结果：%@",[data description]);
    
}

-(void)quickSortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            while (i+1 < [aData count] && [aData objectAtIndex:++i] < [aData objectAtIndex:left]) ;
            while (j-1 > -1 && [aData objectAtIndex:--j] > [aData objectAtIndex:left]) ;
            if (i >= j) {
                break;
            }
            [self swapWithData:aData index1:i index2:j];
        }
        [self swapWithData:aData index1:left index2:j];
        [self quickSortWithArray:aData left:left right:j-1];
        [self quickSortWithArray:aData left:j+1 right:right];
    }
}

-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
    NSNumber *tmp = [aData objectAtIndex:index1];
    [aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
    [aData replaceObjectAtIndex:index2 withObject:tmp];
}

//------------------这是另外一个版本------------------------------------------


//冒泡排序
-(void)bubbleSort:(NSMutableArray*)array
{
    NSLog(@"the unsorted array is : %@",array);
    for (int i = 0; i<array.count; i++) {
        for (int j=0; j<array.count-i-1; j++) {
            if ([array[j] intValue] > [array[j+1] intValue]) {
                
                NSNumber* temp = array[j];
                [array replaceObjectAtIndex:j withObject:array[j+1]];
                [array replaceObjectAtIndex:j+1 withObject:temp];
            }
        }
    }
    NSLog(@"the sorted array is : %@",array);
    
}

//选择排序
-(void)selectSort:(NSMutableArray *)array
{
    for (int i=0; i<array.count-1; i++) {
        int m =i;
        for (int j =i+1; j<array.count; j++) {
            if ([array[j] intValue] < [array[m] intValue]) {
                m = j;
            }
        }
        if (m != i) {
            NSNumber* temp = array[m];
            [array replaceObjectAtIndex:m withObject:array[i]];
            [array replaceObjectAtIndex:i withObject:temp];
        }
    }
    NSLog(@"选择排序后的结果：%@",array);
}

//插入排序
-(void)insertSort:(NSMutableArray *)array{
    
    for (int i = 1; i < array.count; i++) {
        id tmp = array[i];
        int j = i-1;
        while (j != -1 && [array[j] intValue] > [tmp intValue]) {
            [array replaceObjectAtIndex:j+1 withObject:array[j]];
            j--;
        }
        [array replaceObjectAtIndex:j+1 withObject:tmp];
    }
    NSLog(@"插入排序后的结果：%@",array);
}

//快速排序
-(void) quickSort:(NSMutableArray *)array {
    
    [self quickSortWithArr:array left:0 right:array.count];
    
}
//
-(void)quickSortWithArr:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            while (i+1 < [aData count] && [aData objectAtIndex:++i] < [aData objectAtIndex:left]) ;
            while (j-1 > -1 && [aData objectAtIndex:--j] > [aData objectAtIndex:left]) ;
            if (i >= j) {
                break;
            }
            [self swapWithData:aData index1:i index2:j];
        }
        [self swapWithData:aData index1:left index2:j];
        [self quickSortWithArr:aData left:left right:j-1];
        [self quickSortWithArr:aData left:j+1 right:right];
    }
}

//------------------从这里开始是------------------------------------------
-(void) outputObj{
    NSString * string = @"eevvitttcccejbboo";
    NSString * finalString  = @"";
    NSString * tmpStr  = @"";
    
    for (int i = string.length-1; i>=0; i--) {
        
        NSString *tmp = [string substringWithRange:NSMakeRange(i, 1)];
        
        if(![tmp isEqualToString: tmpStr]){
            finalString = [finalString stringByAppendingString:tmp];
            tmpStr = tmp;
        }
    }
    
    NSLog(@"the string is : %@",finalString);
    
}



- (IBAction)buttonConfirm:(id)sender {
//    [self reverse:49];
//    [self xuanze:_arr];
//    [self newSelectSort:_arr];
    [self binarySearch:_arr element:@"92"];

}


-(int) quicksortArr:(NSMutableArray*)arr left:(int)left right:(int)right {

    id tmp = _arr[0];
    
    while (right>=left) {
        
        while (right>=0) {
            if ([tmp integerValue]>=[_arr[right]integerValue]) {
                _arr[left] = _arr[right];
                break;
            }
            right--;
        }
        
        while (left<_arr.count) {
            
            if ([tmp integerValue]<=[_arr[left]integerValue]) {
                    _arr[right] = _arr[left];
                break;
            }
            left++;
            
        }
        
    }
    _arr[right] = tmp;
    return left;
//    NSLog(@"%@",_arr);

}

//递推
-(void)rabbit {
    
    int r = 1;
    int s = 1;
    int t = 0;
    for (int i = 2; i<12;i++) {
        t = r+s;
        r= s;
        s = t;
    }
    NSLog(@"------------------------- %d",t);
    
}
//逆向递推
-( void) reverse:(int)month {
    
    float monRate = 1.71/100/12;
    float last = 3000;
    float first = 0;
    
    for(int i=month;i>0;i--) {
        
        first = (last+3000)/(1+monRate);
        last = first;
    }
    
    NSLog(@"%f",first);
}


-(int)jiecheng:(int)num{
    if (num==1) {
        return 1;
    }
    return num*[self jiecheng:num-1];
    
}

//递归遍历多维数组(深度)
-(void) bianli:(NSArray *) arr {

    for(int i=0;i<arr.count;i++){
    
        if([arr[i] isKindOfClass:[NSArray class]]) {
            [self bianli:arr[i]];
        } else {
            NSLog(@"%@",arr[i]);
        }
    }
}

//递归遍历多维数组(广度)
-(void) newbianli:(NSArray *) arr {
    
    if(arr.count<1)
        return;
    
    NSMutableArray *tmparr = [NSMutableArray array];
    
    for(int i=0;i<arr.count;i++){
        
        if([arr[i] isKindOfClass:[NSArray class]]) {
            [tmparr addObjectsFromArray:arr[i]];
            
        } else {
            NSLog(@"%@",arr[i]);
        }
    }
    [self newbianli:[NSArray arrayWithArray:tmparr]];
}

//枚举
/*   a b c d e
 
    x        a
 --------------
     e e e e e
 
 0-9
 */

-(void) meiju{
    
    NSArray *array = @[@"11111",@"22222",@"33333",@"44444",@"55555",@"66666",@"77777",@"88888",@"99999"];
    NSArray *arrayb = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    for (int i=0;i<array.count;i++) {
        
        for (int j=0; j<arrayb.count; j++) {
            
            NSInteger a = [array[i] integerValue]/[arrayb[j] integerValue];
            NSInteger b = [arrayb[j] integerValue];
            NSInteger c= [array[i] integerValue];

            //a[0]==b&&a[4]==c/11111
        }
        
        
        
    }
}

-(void) newSelectSort:(NSMutableArray *)array {
    
    for (int i = 0; i<array.count; i++) {
        int tmp = i;
        
        for (int j=i+1; j<array.count; j++) {
            
            if([array[tmp] intValue]>[array[j] intValue]){
                tmp = j;
            }
        }
        
        NSString *str = array[i];
        array[i] = array[tmp];
        array[tmp] = str;
        
    }
    NSLog(@"%@",array);
    
}


-(void) maopao:(NSMutableArray *)array {
    NSLog(@"冒泡排序前：%@",array);
    for (int i=0; i<array.count; i++) {
        //-------------------------------------------
        
        
        //-------------------------------------------
    }
    NSLog(@"冒泡排序后：%@",array);
}

-(void) xuanze:(NSMutableArray *)array {
    NSLog(@"选择排序前：%@",array);
    for (int i=0; i<array.count; i++) {
        //-------------------------------------------
        int tmp = i;
        for (int j=i; j<array.count; j++) {

            if ([array[j] intValue] < [array[tmp] intValue]) {
                tmp = j;
            }

        }
        NSString *str = array[tmp];
        array[tmp] = array[i];
        array[i] = str;
        //-------------------------------------------
    }
    NSLog(@"选择排序后：%@",array);

}

-(void) charu:(NSMutableArray*)array {
//    NSLog(@"选择排序前：%@",array);
//    for (int i = 1; i < array.count; i++) {
//        //-----------------------------------------------
//        NSString *tmp = array[i];
//        
//        for (int j =i-1; ; j++) {
//            
//        }
//        
//        //-----------------------------------------------
//    }
//    NSLog(@"选择排序后：%@",array);
}

//二分查找
-(void) binarySearch:(NSMutableArray *)array element:(NSString *)ele {

    //封印
//    int total = array.count;
//    int half;
//    int antoher;
//    
//    while (total>1) {
//        half = total/2;
//        antoher = total-half;
//        
//        for (int i=half;i<total;i++) {
//            if ([ele isEqualToString:array[i]]) {
//                NSLog(@"元素的index为：%d，值为：%@",i,ele);
//                return;
//            }
//        }
//        total = antoher;
//    }
//    NSLog(@"没找着");

    //先进行选择排序
    for (int i=0; i<array.count; i++) {
        
        int tmp = i;
        for (int j=i+1; j<array.count; j++) {
            
            if ([array[tmp]intValue]>[array[j]intValue]) {
                tmp = j;
            }
        }
        NSString *str = array[i];
        array[i] = array[tmp];
        array[tmp] = str;
    }
    NSLog(@"排序后的数组：%@",array);
    
    //二分查找
    int low = 0;
    int high = array.count-1;
    int mid;
    
    while (low<=high) {
        
        mid = (low+high)/2;
        
        if ([ele intValue] == [array[mid]intValue]) {
            NSLog(@"找到 %@，位置为%d",ele,mid);
            return;
        } else {

            if ([ele intValue]>[array[mid]intValue]) {
                low = mid+1;
            } else {
                high = mid-1;
            }
        }
    }
    NSLog(@"没找到");
    

    
}

@end