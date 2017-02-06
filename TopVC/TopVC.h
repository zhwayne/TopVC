//
//  TopVC.h
//  TopVC
//
//  Created by 张尉 on 2017/2/6.
//  Copyright © 2017年 wayne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TopVC : NSObject

@property (nonatomic, strong, readonly) UIViewController *top;

+ (instancetype)shared;

@end
