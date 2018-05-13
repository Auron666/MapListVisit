//
//  MapViewController.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol MapViewControllerDelegate <NSObject>
- (void)mapDidSelectPinAtIndex:(NSUInteger)index;
@end

@protocol MapPinViewModel <NSObject, MKAnnotation>
@property (nonatomic, nonnull, copy, readonly) NSString *title;
@property (nonatomic, nonnull, strong, readonly) CLLocation *location;
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign, readonly) BOOL selected;
@end

@protocol MapViewControllerViewModel <NSObject>
@property (nonatomic, nullable, weak, readonly) id<MapViewControllerDelegate> delegate;
@property (nonatomic, nonnull, strong, readonly) NSArray< id<MapPinViewModel> > *pins;
@property (nonatomic, assign, readonly) NSUInteger selectedPinIndex;
@end

@interface MapViewController : UIViewController

@property (nonatomic, nonnull, copy) id<MapViewControllerViewModel> viewModel;

@end
