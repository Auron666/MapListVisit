//
//  Organization+ViewModelAdapter.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "Organization.h"
#import "MapViewController.h"


@interface Organization (ViewModelAdapter) <MapPinViewModel>

@property (nonatomic, nonnull, strong, readonly) CLLocation *location;
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) BOOL selected;

@end
