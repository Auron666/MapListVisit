//
//  MainViewController.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+Extension.h"
#import "NSArray+Extension.h"

#import "Service.h"
#import "Visit.h"
#import "Organization.h"

#import "Visit+ViewModelAdapter.h"
#import "Organization+ViewModelAdapter.h"

#import "MainFlowViewModel.h"

#import "ListCell.h"
#import "ListViewController.h"
#import "MapViewController.h"


@interface MainViewController () <ListViewControllerDelegate, MapViewControllerDelegate>

@property (nonatomic, nonnull, strong) NSObject<Service> *service;

@property (nonatomic, nullable, weak) ListViewController *listVC;
@property (nonatomic, nullable, weak) MapViewController *mapVC;

@property (nonatomic, nullable, strong) MainFlowViewModel *viewModel;

@end

@implementation MainViewController

+ (instancetype)createWithService:(NSObject<Service> *)service{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle];
    MainViewController *obj = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self)];

    obj.service = service;
    return obj;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)start{
    [self setupChildren];
    [self reloadData];
}

- (void)setupChildren{
    ListViewController *listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ListViewController"];
    MapViewController *mapVC   = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];

    self.listVC = listVC;
    self.mapVC = mapVC;

    UISplitViewController *splitVC = [UISplitViewController new];
    splitVC.viewControllers = @[ listVC.wrappedInNavController, mapVC ];
    [self addChildVC:splitVC];
}


- (void)reloadData{
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{

        dispatch_group_t group = dispatch_group_create();
        __block NSArray<Organization *> *organizations = @[];
        __block NSArray<Visit *> *visits = @[];

        dispatch_group_enter(group);

        [self.service getVisitListWithCompletion:^(NSArray<Visit *> *_Nonnull list) {
            visits = list;
            dispatch_group_leave(group);
        }];

    
        dispatch_group_enter(group);

        [self.service getOrganizationListWithCompletion:^(NSArray<Organization *> *_Nonnull list) {
            organizations = list;
            dispatch_group_leave(group);
        }];

        
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        self.viewModel = [MainFlowViewModel viewModelWithVisits:visits organizations:organizations delegate:self];

        dispatch_async(dispatch_get_main_queue(), ^{
            self.listVC.viewModel = self.viewModel;
            self.mapVC.viewModel = self.viewModel;
        });
    });
}


- (BOOL)checkDeps{
    return self.storyboard && self.service;
}

- (void)mapDidSelectPinAtIndex:(NSUInteger)index{
    NSLog(@"Index = %lu", index);
    self.viewModel.selectedPinIndex = index;

    self.listVC.viewModel = self.viewModel;
    self.mapVC.viewModel = self.viewModel;
}

- (void)listDidSelectItemAtIndex:(NSUInteger)index{
    NSLog(@"Index = %lu", index);
    self.viewModel.selectedItemIndex = index;
    
    self.listVC.viewModel = self.viewModel;
    self.mapVC.viewModel = self.viewModel;
}

@end



