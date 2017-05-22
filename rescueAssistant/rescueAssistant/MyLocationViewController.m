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

@implementation MyLocationViewController
- (void)viewDidLoad{
    [self loadData];
}
- (void)viewDidAppear:(BOOL)animated{

}

- (void)loadData{
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"Device"];
    NSMutableArray *arrM=[NSMutableArray array];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            Locations *model=[Locations locationsWithDict:obj];
            [arrM addObject:model];
            //打印playerName
            NSLog(@"obj.playerName = %@", [obj objectForKey:@"playerName"]);
            //打印objectId,createdAt,updatedAt
            NSLog(@"obj.objectId = %@", [obj objectId]);
            NSLog(@"obj.createdAt = %@", [obj createdAt]);
            NSLog(@"obj.updatedAt = %@", [obj updatedAt]);
        }
    }];
}
@end
