//
//  Entity.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

@import Foundation;

@protocol Entity <NSObject>

@property (class, nonatomic, nonnull, strong, readonly) NSDictionary<NSString *, NSString *> *mapping;
+ (nullable instancetype)createWithJSON:(nonnull NSDictionary<NSString *, id> *)json;

@end

@interface Entity : NSObject <Entity>
@end
