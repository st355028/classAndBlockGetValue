//
//  MyTableViewController.m
//  classAndBlockGetValue
//
//  Created by MinYeh on 2016/8/8.
//  Copyright © 2016年 MINYEH. All rights reserved.
//


#import "MyTableViewController.h"
#import "DealWithJson.h"
#import "MyTableViewCell.h"
#import "motoInfo.h"
//typedef void(^Completion)(NSArray* youWantToSave);
#define TAOYUAN @"https://raw.githubusercontent.com/LazyScream/FixMoto/master/FixMotoJson/Taoyuan.json"

@interface MyTableViewController ()
{
    NSArray * tmp;
    NSArray * motoInfoArray;
    DealWithJson * json;
}
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tmp = [NSArray new];
    json = [DealWithJson new];
    
    
    //使用Block 取值
//    [json Connetion:TAOYUAN andCallBlock:^(NSArray *youWantToSave) {
//        
//
//        motoInfoArray = [[NSArray alloc]initWithArray:youWantToSave];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//        
//    }];
    
    
    //使用NSUserDefault 取值
    //每一筆區域資料
    [json Connetion:TAOYUAN andCountryToChoice:@"TAOYUAN"];
    
    
    NSData * data = [[NSUserDefaults standardUserDefaults]objectForKey:@"TAOYUAN"];
    motoInfoArray = [[NSArray alloc]initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    
    
  
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return motoInfoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
    cell.title.text = [motoInfoArray[indexPath.row]motoName];
    cell.phone.text = [motoInfoArray[indexPath.row]motoPhone];
    cell.address.text = [motoInfoArray[indexPath.row]motoAddress];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
