//
//  TableViewHeaderView.h
//  TableViewZheDie
//
//  Created by apple2015 on 16/6/29.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewHeaderView;
@protocol TableViewHeaderViewDelegate <NSObject>


- (void)tableViewHeaderView:(TableViewHeaderView *)headerView WithIndexpath:( NSInteger)sections;

@end

@interface TableViewHeaderView : UITableViewHeaderFooterView
@property(nonatomic,assign)id  <TableViewHeaderViewDelegate> delegate;
@property(nonatomic,assign)NSInteger  sections;
+(instancetype)tableViewHeaderFooter:(UITableView *)tableView;
- (void)configurationHeaderView:(id)model;

@end
