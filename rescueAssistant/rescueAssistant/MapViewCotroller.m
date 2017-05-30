//
//  MapViewCotroller.m
//  rescueAssistant
//
//  Created by chenxxx on 17/3/27.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "MapViewCotroller.h"
#import "RootViewController.h"
#import <BmobSDK/Bmob.h>
#import "Locations.h"
#import "LocationsCell.h"

@interface MapViewCotroller(){
    NSTimer *timer;
}

@property (strong,nonatomic) CLLocation *currLocation;
@property (strong,nonatomic) NSString *plistPath;
@property (weak, nonatomic) IBOutlet UILabel *jing;
@property (weak, nonatomic) IBOutlet UILabel *wei;
- (IBAction)sideButton:(id)sender;


@end
@implementation MapViewCotroller

- (IBAction)backMyLocation:(id)sender {
    [_mapView setCenterCoordinate:(CLLocationCoordinate2D){_currLocation.coordinate.latitude,_currLocation.coordinate.longitude} animated:YES];
  }

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [path objectAtIndex:0];
    self.plistPath = [documentsPath stringByAppendingPathComponent:@"Locations.plist"];
 
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    self.mapView.showsScale = TRUE;
    self.mapView.userLocation.title = @"1";
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1.0f;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
       
    timer = [NSTimer scheduledTimerWithTimeInterval:10 repeats:YES block:^(NSTimer *_Nonnull timerbmob){
        BmobQuery   *bquery = [BmobQuery queryWithClassName:@"Device"];
        [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            [_mapView removeAnnotations:_mapView.annotations];
            NSMutableArray *arrM=[NSMutableArray array];
            for (BmobObject *obj in array) {
                MKPointAnnotation *annotation0 = [[MKPointAnnotation alloc] init];
                [annotation0 setCoordinate:CLLocationCoordinate2DMake([[obj objectForKey:@"longitude"] floatValue],[[obj objectForKey:@"latitude"] floatValue])];
                [_mapView addAnnotation:annotation0];
                
                CLLocation *curLocation = [[CLLocation alloc] initWithLatitude:_currLocation.coordinate.longitude longitude:_currLocation.coordinate.latitude];
                
                CLLocation *otherLocation = [[CLLocation alloc] initWithLatitude:[[obj objectForKey:@"latitude"] floatValue] longitude:[[obj objectForKey:@"longitude"] floatValue]];
            //    NSLog(@"%@",curLocation);
              //  NSLog(@"%@",otherLocation);
                double  distance  = [curLocation distanceFromLocation:otherLocation];
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                [dic setObject:[obj objectForKey:@"portrait"] forKey:@"portrait"];
                [dic setObject:[obj objectForKey:@"name"] forKey:@"name"];
                [dic setObject:[obj objectForKey:@"longitude"] forKey:@"longitude"];
                [dic setObject:[obj objectForKey:@"latitude"] forKey:@"latitude"];
                [dic setObject:[NSString stringWithFormat:@"%f", distance] forKey:@"distance"];
                [arrM addObject:dic];
                
              
            }
            [arrM writeToFile:_plistPath atomically:YES];
          //  NSMutableArray *dataArray = [[NSMutableArray alloc] initWithContentsOfFile:_plistPath];
          //  NSLog(@"---plist一开始保存时候的内容---%@",dataArray);
        }];
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self.locationManager startUpdatingLocation];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: animated];
    [self.locationManager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations{
     _currLocation = [locations lastObject];
  //  self.jing.text = [NSString stringWithFormat:@"%3.5f",_currLocation.coordinate.latitude];
  //  self.wei.text = [NSString stringWithFormat:@"%3.5f",_currLocation.coordinate.longitude];
  //  self.gao.text = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //2.向文件中写入内容
    [userDefaults setObject:self.jing.text forKey:@"jing"];
    [userDefaults setObject:self.wei.text forKey:@"wei"];
    //2.1立即同步
    [userDefaults synchronize];
}
- (CLLocation *)getMyLocation{
    return _currLocation;
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(nonnull NSError *)error{
    NSLog(@"error: %@",error);
}
- (IBAction)sideButton:(id)sender {
    [self.sideMenuViewController presentLeftMenuViewController];
}
@end
