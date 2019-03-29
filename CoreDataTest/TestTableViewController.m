//
//  TestTableViewController.m
//  CoreDataTest
//
//  Created by  evafan2003 on 16/5/16.
//  Copyright © 2016年 com.mosh. All rights reserved.
//

#import "TestTableViewController.h"
#import "FirstTableViewCell.h"

@interface TestTableViewController () {
    CADisplayLink *link;
}

@end

@implementation TestTableViewController

-(void) didMoveToParentViewController:(UIViewController *)parent {
    //在这里
        if (!parent) {
            [link invalidate];
        }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArr = @[@"aa",@"bb",@"cc",@"dd",@"ee",@"ff",@"gg",@"hh",@"ii",@"jj",@"kk",];
    _rowNumber = _dataArr.count;
//    _rowHeight = 80;
    
    self.tableView.rowHeight =80;
    
    
    [self tableviewTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell" forIndexPath:indexPath];
    NSString *string = _dataArr[indexPath.row];
    cell.title.text = string;
//    cell.detail.text = [NSString stringWithFormat:@"这里展示的是%@的描述",string];
    cell.rowCount = (int)indexPath.row;
    // Configure the cell...
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) tableviewTimer {

    link = [CADisplayLink displayLinkWithTarget:self selector:@selector(fire)];
    link.frameInterval = 60;//设置间隔的frameInterval属性，其决定于屏幕刷新多少帧时调用一次该方法，默认为1，即1/60秒调用一次
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void) fire {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cell fire" object:nil];
}
@end
