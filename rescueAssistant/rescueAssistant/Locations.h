//
//  Locations.h
//  rescueAssistant
//
//  Created by chenxxx on 17/5/13.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Locations : NSObject
@property (nonatomic, copy) NSString *portrait;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *distance;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)locationsWithDict:(NSDictionary *)dict;
@end
