//
//  Locations.m
//  rescueAssistant
//
//  Created by chenxxx on 17/5/13.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "Locations.h"

@implementation Locations

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}




+(instancetype)locationsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
