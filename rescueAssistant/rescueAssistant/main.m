//
//  main.m
//  rescueAssistant
//
//  Created by chenxxx on 17/3/23.
//  Copyright © 2017年 chenxxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *appKey = @"a4a0b9734403cbe16f4332ca04da85ee";
        [Bmob registerWithAppKey:appKey];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
