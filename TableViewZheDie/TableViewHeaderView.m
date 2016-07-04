//
//  TableViewHeaderView.m
//  TableViewZheDie
//
//  Created by apple2015 on 16/6/29.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "TableViewHeaderView.h"
@interface TableViewHeaderView ()

@property (nonatomic, strong)   UILabel *titleLabel;

@end
@implementation TableViewHeaderView


+(instancetype)tableViewHeaderFooter:(UITableView *)tableView
{
    static NSString * ID=@"TableViewHeaderView";
    
    TableViewHeaderView * headView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (!headView) {
        
        headView=[[TableViewHeaderView alloc]initWithReuseIdentifier:ID];
        
    }
    return headView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }
    
    return self;
}


- (void)createUI
{
    
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    
    
    [self addGestureRecognizer:tap];
    
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    self.titleLabel.textAlignment=0;
    self.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.titleLabel];
    
    
}


- (void)handleTap:(UITapGestureRecognizer *)tap
{

    if (_delegate&&[_delegate respondsToSelector:@selector(tableViewHeaderView:WithIndexpath:)]) {
        
        [_delegate tableViewHeaderView:self WithIndexpath:_sections];
    }
    
    
}

- (void)configurationHeaderView:(id)model
{
    
    self.titleLabel.text=model;
}


@end
