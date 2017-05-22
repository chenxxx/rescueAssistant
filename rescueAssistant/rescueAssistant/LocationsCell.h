//
//  LocationsCell.h
//  rescueAssistant
//
//  Created by chenxxx on 17/5/13.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Locations;

@interface LocationsCell : UITableViewCell

@property (nonatomic, strong) Locations *locations;


+ (instancetype)cellWithTableView:(UITableView *)tableVeiw ;

@end
