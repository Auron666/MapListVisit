//
//  SBTVisit.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface Visit : Entity

@property (nonatomic, assign, readonly) NSUInteger objID;
@property (nonatomic, assign, readonly) NSUInteger organizationID;
@property (nonatomic, nonnull, strong, readonly) NSString *title;

@end
