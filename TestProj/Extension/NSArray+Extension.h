//
//  NSArray+Extension.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <Foundation/Foundation.h>

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface NSArray<__covariant T> (Extension)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (nonnull NSArray<id> *)map:( nonnull id _Nullable (^)(T _Nonnull obj) )block;
- (nonnull NSArray<T> *)filter:( nonnull BOOL (^)(T _Nonnull obj) )block;
- (nullable T)findFirst:( nonnull BOOL (^)(T _Nonnull obj) )block;

- (nonnull NSDictionary<id, T> *)groupBy:(nonnull NSString *)key;

@end
