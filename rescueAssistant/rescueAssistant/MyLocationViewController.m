//
//  MyLocationViewController.m
//  rescueAssistant
//
//  Created by chenxxx on 17/3/27.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "MyLocationViewController.h"
#import "MapViewCotroller.h"
#import <RESideMenu/RESideMenu.h>
#import "RootViewController.h"
#import "SideMenuViewController.h"
#import "TabBarViewController.h"
#import "MJRefresh.h"
#import <BmobSDK/Bmob.h>
#import "Locations.h"
#import "LocationsCell.h"

@interface MyLocationViewController()

@property(nonatomic,strong)NSMutableArray *locationsList;
//@property(nonatomic)NSInteger index;
@property (strong,nonatomic) NSString *plistPath;

@end

@implementation MyLocationViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    [self.tableView.mj_header beginRefreshing];
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [path objectAtIndex:0];
    self.plistPath = [documentsPath stringByAppendingPathComponent:@"Locations.plist"];

    self.tableView.backgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    self.tableView.rowHeight=125;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

- (void)viewDidAppear:(BOOL)animated{

}

-(NSMutableArray *)locationsList{
    if (_locationsList==nil) {

        _locationsList=[NSMutableArray arrayWithContentsOfFile:_plistPath];
        NSMutableArray *arrM=[NSMutableArray array];
        for (NSDictionary *dict in  _locationsList) {
            Locations *model=[Locations  locationsWithDict:dict];
            [arrM addObject:model];
        }
        _locationsList=arrM;
    }
    return _locationsList;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.locationsList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LocationsCell *cell=[LocationsCell cellWithTableView:tableView];
    cell.locations=self.locationsList[indexPath.row];
    
    return cell;
}

-(void)refresh{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    });
    
}

@end
