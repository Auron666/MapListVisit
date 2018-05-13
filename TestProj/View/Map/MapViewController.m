//
//  MapViewController.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

@import MapKit;
@import CoreLocation;

#import <MapKit/MapKit.h>

#import "MapViewController.h"
#import "NSArray+Extension.h"


@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end


@implementation MapViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setViewModel:(id<MapViewControllerViewModel>)viewModel{
    _viewModel = viewModel;

    self.mapView.userInteractionEnabled = NO;
    self.mapView.delegate = nil;
    
    NSMutableArray< id<MKAnnotation> > *toRemove = self.mapView.annotations.mutableCopy;
    [toRemove removeObjectsInArray:viewModel.pins];
    
    [self.mapView removeAnnotations:toRemove];
    [self.mapView showAnnotations:viewModel.pins animated:YES];
    
    id<MapPinViewModel> selected = [viewModel.pins findFirst:^BOOL(id<MapPinViewModel>  _Nonnull obj) {
        return obj.selected;
    }];

    [self.mapView selectAnnotation:selected animated:YES];

    self.mapView.delegate = self;
    self.mapView.userInteractionEnabled = YES;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    NSUInteger idx = [self.viewModel.pins indexOfObject:(id<MapPinViewModel>)view.annotation];
    [self.viewModel.delegate mapDidSelectPinAtIndex:idx];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    
    [CATransaction setCompletionBlock:^{
        if( self.mapView.selectedAnnotations.count == 0 ){
            [self.viewModel.delegate mapDidSelectPinAtIndex:NSNotFound];
        }
    }];
}

@end



