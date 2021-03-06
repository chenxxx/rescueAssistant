//
//  LocationsCell.m
//  rescueAssistant
//
//  Created by chenxxx on 17/5/13.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import "LocationsCell.h"
#import "Locations.h"
#import <UIKit+AFNetworking.h>
#import "MJRefresh.h"

@interface LocationsCell ()

@property (nonatomic, weak) UIImageView *portraitV;
@property (nonatomic, weak) UILabel *nameV;
@property (nonatomic, weak) UILabel *longitudeV;
@property (nonatomic, weak) UILabel *latitudeV;
@property (nonatomic, weak) UILabel *distanceV;

@end

@implementation LocationsCell

+ (instancetype)cellWithTableView:(UITableView *)tableVeiw {
    static NSString *ID = @"Locations";
    LocationsCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LocationsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *portraitV = [[UIImageView alloc]init];
        [self.contentView addSubview:portraitV];
        self.portraitV = portraitV;
        
        UILabel *nameV = [[UILabel alloc]init];
        nameV.font = [UIFont systemFontOfSize:21];
        nameV.textAlignment = NSTextAlignmentCenter;
        nameV.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
        [self.contentView addSubview:nameV];
        self.nameV = nameV;
        
        UILabel *longitudeV = [[UILabel alloc]init];
        longitudeV.font = [UIFont systemFontOfSize:15];
        longitudeV.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
        [self.contentView addSubview:longitudeV];
        self.longitudeV = longitudeV;
        
        UILabel *latitudeV = [[UILabel alloc]init];
        latitudeV.font = [UIFont systemFontOfSize:15];
        latitudeV.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
        [self.contentView addSubview:latitudeV];
        self.latitudeV = latitudeV;
        
        UILabel *distanceV = [[UILabel alloc]init];
        distanceV.font = [UIFont systemFontOfSize:15];
        latitudeV.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
        [self.contentView addSubview:distanceV];
        self.distanceV = distanceV;
    }
    return self;
}




-(void)setLocations:(Locations *)locations{
    _locations=locations;
    [self settingFrame];
    [self settingData];
}


 -(void)settingData{
 
     NSURL *url=[NSURL URLWithString:_locations.portrait];
    [self.portraitV setImageWithURL:url placeholderImage:[UIImage imageNamed:@"headImg"]];
    self.nameV.text=_locations.name;
    self.longitudeV.text= [NSString stringWithFormat:@"%@",_locations.longitude];;
    self.latitudeV.text= [NSString stringWithFormat:@"%@",_locations.latitude];;
    self.distanceV.text=_locations.distance;
     
}


-(void)settingFrame{
    
    CGFloat portraitW=100;
    CGFloat portraitH=portraitW;
    CGFloat margin=12;
    CGFloat textW=([UIScreen mainScreen].bounds.size.width)-3*margin-portraitW;
    
    self.portraitV.frame=CGRectMake(margin, margin, portraitW, portraitH);
    self.nameV.frame=CGRectMake(CGRectGetMaxX(self.portraitV.frame)+margin, margin, textW, 20);
    self.longitudeV.frame=CGRectMake(CGRectGetMaxX(self.portraitV.frame)+margin, margin+25, textW, 20);
    self.latitudeV.frame=CGRectMake(CGRectGetMaxX(self.portraitV.frame)+margin, margin+50, textW, 20);
    self.distanceV.frame=CGRectMake(CGRectGetMaxX(self.portraitV.frame)+margin, margin+75, textW, 20);
    
}

@end
