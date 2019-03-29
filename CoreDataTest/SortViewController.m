//
//  SortViewController.m
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "SortViewController.h"
#import "CalculatorMaker.h"

@interface SortViewController ()

@end

@implementation SortViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //make an array
    _arr = [NSMutableArray arrayWithArray:@[@"92",@"76",@"123",@"8",@"38",@"55",@"23",@"43"]];
    
    _array = @[@"92",@"76",@"123",@[@"z",@"y",@"x",@[@"6",@"6",@"6",@"6",@"6"],@"v",@"u",@"q",],@"38",@"55",@"23",@"43",@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",]];
    NSString *str = [_arr componentsJoinedByString:@","];
    _orignal.text = [NSString stringWithFormat:@"排序前数组：%@",str];
    
    
//    CalculatorMaker *maker = [[CalculatorMaker alloc] init];
//    maker.add(1).add(1);
//    NSLog(@"%d",maker.result);
    
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
    
    for (NSInteger i = string.length-1; i>=0; i--) {
        
        NSString *tmp = [string substringWithRange:NSMakeRange(i, 1)];
        
        if(![tmp isEqualToString: tmpStr]){
            finalString = [finalString stringByAppendingString:tmp];
            tmpStr = tmp;
        }
    }
    
    NSLog(@"the string is : %@",finalString);
    
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

//阶乘
-(int)jiecheng:(int)num{
    if (num==1) {
        return 1;
    }
    return num*[self jiecheng:num-1];
    
}


//冒泡
- (IBAction)maopao:(id)sender {
    NSMutableArray *array = _arr;
    NSLog(@"冒泡排序前：%@",array);
    for (int i=0; i<array.count; i++) {
        //-------------------------------------------
        
        //-------------------------------------------
    }
    NSLog(@"冒泡排序后：%@",array);
}

//选择
- (IBAction)xuanze:(id)sender {
    
    NSMutableArray *array = _arr;
    NSLog(@"选择排序前：%@",array);
    for (int i=0; i<array.count; i++) {
        //-------------------------------------------
        int tmp = i;
        for (int j = i+1; j<array.count; j++) {
            if ([array[j]intValue]<[array[tmp]intValue]) {
                tmp = j;
            }
        }
        NSString *str = array[i];
        array[i] = array[tmp];
        array[tmp] = str;
        //-------------------------------------------
    }
    NSLog(@"选择排序后：%@",array);
    NSString *str = [array componentsJoinedByString:@","];
    _sorted.text = [NSString stringWithFormat:@"排序后数组：%@",str];
}

//插入
- (IBAction)charu:(id)sender {
    NSMutableArray *array = _arr;
    NSLog(@"冒泡排序前：%@",array);
    //-------------------------------------------
    
    //-------------------------------------------
    NSLog(@"选择排序后：%@",array);
}

//快速
- (IBAction)kuaisu:(id)sender {
    NSMutableArray *array = _arr;
    NSLog(@"冒泡排序前：%@",array);
    //-------------------------------------------
    
    //-------------------------------------------
    NSLog(@"选择排序后：%@",array);
}

//希尔
- (IBAction)xier:(id)sender {
    NSMutableArray *array = _arr;
    NSLog(@"冒泡排序前：%@",array);
    //-------------------------------------------
    
    //-------------------------------------------
    NSLog(@"选择排序后：%@",array);
}

//堆
- (IBAction)dui:(id)sender {
    NSMutableArray *array = _arr;
    NSLog(@"冒泡排序前：%@",array);
    //-------------------------------------------
    
    //-------------------------------------------
    NSLog(@"选择排序后：%@",array);
}

//归并
- (IBAction)guibing:(id)sender {
    NSMutableArray *array = _arr;
    NSLog(@"冒泡排序前：%@",array);
    //-------------------------------------------
    
    //-------------------------------------------
    NSLog(@"选择排序后：%@",array);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
