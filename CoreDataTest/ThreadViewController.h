//
//  ThreadViewController.h
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadViewController : UIViewController

- (IBAction)threadStart:(id)sender;
@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) NSDictionary*dictionary;
@end
