//
//  FindViewController.m
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()
@property (nonatomic, strong) UIImagePickerController *picker;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _picker = [[UIImagePickerController alloc] init];
    _picker.allowsEditing = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSInteger low = 0;
    NSInteger high = array.count-1;
    NSInteger mid;
    
    while (low<=high) {
        
        mid = (low+high)/2;
        
        if ([ele intValue] == [array[mid]intValue]) {
            NSLog(@"找到 %@，位置为%li",ele,(long)mid);
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

//枚举
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
    
    NSMutableArray *tmparr = [NSMutableArray array];
    
    for(int i=0;i<arr.count;i++){
        
        if([arr[i] isKindOfClass:[NSArray class]]) {
            [tmparr addObjectsFromArray:arr[i]];
            
        } else {
            NSLog(@"%@",arr[i]);
        }
    }
    if(tmparr.count<1)
        [self newbianli:[NSArray arrayWithArray:tmparr]];
}


-(int) addWithA:(int)a B:(int)b{
    if (b<30) {
        b++;
        NSLog(@"%d-%d",a,b);
        a += [self addWithA:a B:b];
    }
    return a;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//九九乘法表
- (IBAction)chengfabiao:(id)sender {
    
    [self.navigationController pushViewController:_picker animated:YES];
    
//    [self addWithA:1 B:1];
    
//    int x,y,z;
//    
//    for (x=1; x<=9; x++) {
//        
//        for (y=1; y<=x; y++) {
//            
//            z = x*y;
//            NSLog(@"%d*%d=%d",x,y,z);
//        }
//        NSLog(@"\n");
//    }
}

-(void) erfen:(NSMutableArray *)array element:(NSString *)ele {
    
    NSInteger low=0;
    NSInteger high = array.count-1;
    NSInteger mid;
    
    while (low<=high) {

        mid = (low+high)/2;
        
        if ([array[mid] intValue] == [ele intValue]) {
            
            NSLog(@"找到");
            return;
            
        } else if ([array[mid] intValue] > [ele intValue]) {
            
            high = mid+1;
            
        } else {
            low = mid+1;
        }
        
    }
    NSLog(@"没找到");
    
}
@end
