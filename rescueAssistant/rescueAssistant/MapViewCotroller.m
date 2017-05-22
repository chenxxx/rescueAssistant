//
//  MapViewCotroller.m
//  rescueAssistant
//
//  Created by chenxxx on 17/3/27.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "MapViewCotroller.h"
#import "RootViewController.h"
@interface MapViewCotroller()

@property (strong,nonatomic) CLLocation *currLocation;
- (IBAction)sideButton:(id)sender;


@end
@implementation MapViewCotroller

- (IBAction)backMyLocation:(id)sender {
    [_mapView setCenterCoordinate:(CLLocationCoordinate2D){_currLocation.coordinate.latitude,_currLocation.coordinate.longitude} animated:YES];
  //  self.mapView.center = (CGPoint){_currLocation.coordinate.latitude,_currLocation.coordinate.longitude};
  //   [self.mapView setRegion:region animated:YES];
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
 //   self.mapView.showsUserLocation = TRUE;
    self.mapView.showsScale = TRUE;
    self.mapView.userLocation.title = @"1";
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1.0f;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    
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
    self.jing.text = [NSString stringWithFormat:@"%3.5f",_currLocation.coordinate.latitude];
    self.wei.text = [NSString stringWithFormat:@"%3.5f",_currLocation.coordinate.longitude];
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
