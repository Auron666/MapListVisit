//
//  SBTVisit.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "Visit.h"

@interface Visit ()

@property (nonatomic, assign) NSUInteger objID;
@property (nonatomic, assign) NSUInteger organizationID;
@property (nonatomic, nonnull, strong) NSString *title;

@end

@implementation Visit

+ (NSDictionary<NSString *,NSString *> *)mapping{
    return @{
               @"title":           @"title",
               @"organizationId":  @"organizationID"
    };
}

- (NSString *)description{
    return [NSString stringWithFormat:@"objID=%lu, title=%@, organizationID=%lu", self.objID, self.title, self.organizationID];
}

@end



