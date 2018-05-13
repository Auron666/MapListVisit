//
//  Visit+ViewModelAdapter.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "Visit.h"
#import "ListCell.h"

@class Organization;

@interface Visit (ViewModelAdapter) <ListCellViewModel>

@property (nonatomic, nonnull, strong) Organization *organization;

@end
