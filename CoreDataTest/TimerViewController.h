//
//  TimerViewController.h
//  CoreDataTest
//
//  Created by fei he on 2019/3/6.
//  Copyright © 2019年 com.mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerViewController : UIViewController

- (IBAction)NSTimerActive:(id)sender;
- (IBAction)CADisplayLinkActive:(id)sender;
- (IBAction)GCDActive:(id)sender;


@end

NS_ASSUME_NONNULL_END
