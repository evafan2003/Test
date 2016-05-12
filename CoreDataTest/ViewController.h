//
//  ViewController.h
//  CoreDataTest
//
//  Created by  evafan2003 on 16/3/31.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)threadstart:(id)sender;

@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) NSArray *array;

@property (nonatomic, strong) NSString *age;
@property (weak, nonatomic) IBOutlet UITextField *input;
- (IBAction)buttonConfirm:(id)sender;

@end

