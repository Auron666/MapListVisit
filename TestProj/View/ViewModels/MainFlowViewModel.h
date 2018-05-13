//
//  MainFlowViewModel.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "ListViewController.h"
#include "MapViewController.h"

@class Visit, Organization;

@interface MainFlowViewModel : NSObject <ListViewControllerViewModel, MapViewControllerViewModel>

@property (nonatomic, assign) NSUInteger selectedPinIndex;
@property (nonatomic, assign) NSUInteger selectedItemIndex;

+ (nonnull instancetype)viewModelWithVisits:(nonnull NSArray<Visit *> *)visits
                              organizations:(nonnull NSArray<Organization *> *)organizations
                                   delegate:(nullable id<ListViewControllerDelegate, MapViewControllerDelegate>)delegate;

@end
