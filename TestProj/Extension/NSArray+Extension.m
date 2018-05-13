//
//  NSArray+Extension.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "NSArray+Extension.h"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation NSArray (Extension)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSArray<id> *)map:(id _Nullable (^)(id _Nonnull))block
{
    if( !block ) return @[];

    NSMutableArray *result = [NSMutableArray new];

    for( id item in self ) {
        id new = block(item);

        if( new ) {
            [result addObject:new];
        }
    }

    return [result copy];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSArray *)filter:(BOOL (^)(id _Nonnull))block
{
    if( !block ) return @[];

    NSIndexSet *passed = [self indexesOfObjectsPassingTest:^BOOL (id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        return block(obj);
    }];

    return [self objectsAtIndexes:passed];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (id)findFirst:(BOOL (^)(id _Nonnull))block
{
    if( !block ) return nil;
    
    NSUInteger idx = [self indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        *stop = block(obj);
        return *stop;
    }];
    
    return (idx != NSNotFound) ? self[idx] : nil;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSDictionary *)groupBy:(NSString *)key
{
    if( !key ) return nil;

    return [NSDictionary dictionaryWithObjects:self forKeys:[self valueForKeyPath:key]];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@end



