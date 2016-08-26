//
//  MyTableViewCell.h
//  classAndBlockGetValue
//
//  Created by MinYeh on 2016/8/8.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end
