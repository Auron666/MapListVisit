//
//  Organization.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "Organization.h"

@interface Organization ()

@property (nonatomic, assign) NSUInteger objID;
@property (nonatomic, assign) CLLocationDegrees lat;
@property (nonatomic, assign) CLLocationDegrees lon;
@property (nonatomic, nonnull, strong) NSString *title;

@end


@implementation Organization


+ (NSDictionary<NSString *,NSString *> *)mapping{
    return @{
               @"organizationId": @"objID",
               @"title":          @"title",
               @"latitude":       @"lat",
               @"longitude":      @"lon"
    };
}


- (NSString *)description{
    return [NSString stringWithFormat:@"objID=%lu, title=%@, lat=%f, lon=%f", self.objID, self.title, self.lat, self.lon];
}

@end



