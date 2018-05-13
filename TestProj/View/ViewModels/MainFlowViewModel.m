//
//  MainFlowViewModel.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "MainFlowViewModel.h"

#import "NSArray+Extension.h"

#include "Organization.h"
#include "Organization+ViewModelAdapter.h"
#include "Visit.h"
#include "Visit+ViewModelAdapter.h"

@interface MainFlowViewModel ()

@property (nonatomic, nonnull, strong) NSArray<Organization *> *organizations;
@property (nonatomic, nonnull, strong) NSArray<Visit *> *visits;

@property (nonatomic, nullable, weak) NSObject<ListViewControllerDelegate, MapViewControllerDelegate> *delegate;

@end

@implementation MainFlowViewModel

+ (instancetype)viewModelWithVisits:(NSArray<Visit *> *)visits
                      organizations:(NSArray<Organization *> *)organizations
                           delegate:(NSObject<ListViewControllerDelegate,MapViewControllerDelegate> *)delegate{
    NSDictionary<NSNumber *, Organization *> *orgsByID = [organizations groupBy:@"objID"];
    
    [visits enumerateObjectsUsingBlock:^(Visit *_Nonnull v, NSUInteger idx, BOOL *_Nonnull stop) {
        v.organization = orgsByID[ @(v.organizationID) ];
    }];

    MainFlowViewModel *obj = [MainFlowViewModel new];
    obj.delegate = delegate;
    obj.organizations = organizations;
    obj.visits = visits;
    obj.selectedPinIndex = NSNotFound;
    obj.selectedItemIndex = NSNotFound;

    return obj;
}

- (NSArray<id<ListCellViewModel>> *)listItems{
    return self.visits;
}


- (NSArray<id<MapPinViewModel>> *)pins{
    return self.organizations;
}

- (void)setSelectedPinIndex:(NSUInteger)selectedIndex{
    _selectedPinIndex = selectedIndex;
    
    [self.organizations enumerateObjectsUsingBlock:^(Organization * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = (idx == selectedIndex);
    }];
}

- (void)setSelectedItemIndex:(NSUInteger)selectedIndex{
    _selectedItemIndex = selectedIndex;
    
    [self.organizations enumerateObjectsUsingBlock:^(Organization * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = NO;
    }];
    
    if( selectedIndex < self.visits.count ){
        self.visits[selectedIndex].organization.selected = YES;
    }
}

@end



