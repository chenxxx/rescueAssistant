//
//  MapViewCotroller.h
//  rescueAssistant
//
//  Created by chenxxx on 17/3/27.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewCotroller : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;

- (CLLocation *)getMyLocation;
@end
