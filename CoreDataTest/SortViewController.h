//
//  SortViewController.h
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortViewController : UIViewController


@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSDictionary *dictionary;
- (IBAction)maopao:(id)sender;
- (IBAction)xuanze:(id)sender;
- (IBAction)charu:(id)sender;
- (IBAction)kuaisu:(id)sender;
- (IBAction)xier:(id)sender;
- (IBAction)dui:(id)sender;
- (IBAction)guibing:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *orignal;
@property (weak, nonatomic) IBOutlet UILabel *sorted;

@end
