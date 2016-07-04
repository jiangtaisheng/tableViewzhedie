//
//  ViewController.m
//  TableViewZheDie
//
//  Created by apple2015 on 16/6/28.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "ViewController.h"
#import "TableViewHeaderView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,TableViewHeaderViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,assign)NSInteger  selectSection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"tableView的折叠";
    [self.view addSubview:self.tableView ];
    
    
}

-(NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource=[NSMutableArray array];
        
        for (int i=0; i<4; i++) {
            NSString * string=[NSString stringWithFormat:@"%c",'A'+i];
            NSArray * array=@[@"1",@"2",@"3",@"4",@"5",@"6"];
            NSMutableDictionary * dic=[NSMutableDictionary dictionaryWithCapacity:10];
            [dic setValue:@(NO) forKey:@"iS"];
            [dic setValue:array forKey:@"dataArr"];
            [dic setValue:string forKey:@"title"];

//            NSDictionary * dict=@{@"iS":@(NO),@"dataArr":array,@"title":string};
            [_dataSource addObject:dic];
        }
        
        
        
        
        
    }
    
    return _dataSource;
    
}

-(UITableView*)tableView
{
    
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        
    }
    
    
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    
    return self.dataSource.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary * dic=self.dataSource[section];
    BOOL is=[dic[@"iS"]boolValue];
    NSArray * arr=dic[@"dataArr"];
    if (is) {
        
        return arr.count;
    }
    
    return 0;
    
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    NSDictionary * dic=self.dataSource[indexPath.section];
    NSArray * arr=dic[@"dataArr"];
    cell.textLabel.text=arr[indexPath.row];
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary * dic=self.dataSource[section];
    NSString * title=dic[@"title"];
    TableViewHeaderView * headerView=[TableViewHeaderView tableViewHeaderFooter:tableView];
    headerView.backgroundColor=[UIColor greenColor];
    headerView.sections=section;
    headerView.delegate=self;
    [headerView configurationHeaderView:title];
    return headerView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{


    return 40.0;
}

- (void)tableViewHeaderView:(TableViewHeaderView *)headerView WithIndexpath:(NSInteger)sections
{
    
    //1.可同时展开多行
    
//    NSMutableDictionary * dic=self.dataSource[sections];
//    if ([dic[@"iS"] boolValue]) {
//        
//        [dic setValue:@(0) forKey:@"iS"];
//
//    }else{
//    
//        [dic setValue:@(1) forKey:@"iS"];
//
//    }
//
//    [self.tableView reloadData];
    
     //1.同时只展开一行
    

    if (self.selectSection==sections) {
        
        NSMutableDictionary * dic=self.dataSource[sections];
        if ([dic[@"iS"] boolValue]) {
            
            [dic setValue:@(0) forKey:@"iS"];
            
        }else{
            
            [dic setValue:@(1) forKey:@"iS"];
            
        }
 
    }else{
        NSMutableDictionary * dict=self.dataSource[self.selectSection];
        NSMutableDictionary * dic=self.dataSource[sections];
        [dict setValue:@(0) forKey:@"iS"];
        [dic setValue:@(1) forKey:@"iS"];
    
    
    }
    
    
    self.selectSection=sections;

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
