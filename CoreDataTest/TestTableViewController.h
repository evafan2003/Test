//
//  TestTableViewController.h
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewController : UITableViewController

@property(nonatomic, assign) NSInteger rowNumber;
@property(nonatomic, assign) NSInteger rowHeight;
@property(nonatomic, strong) NSArray *dataArr;

@end
