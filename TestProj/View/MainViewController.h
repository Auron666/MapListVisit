//
//  MainViewController.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Service;

@interface MainViewController : UIViewController

+ (nonnull instancetype)createWithService:(nonnull NSObject<Service> *)service;
- (void)start;

@end
