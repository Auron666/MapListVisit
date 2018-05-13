//
//  Entity.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "Entity.h"


@implementation Entity

+ (NSDictionary<NSString *,NSString *> *)mapping{
    return @{};
}

+ (instancetype)createWithJSON:(NSDictionary<NSString *,id> *)json{
    if( !json || ![json isKindOfClass:NSDictionary.class] ){
        NSLog(@"Parse json: %@", json);
        return nil;
    }
    
    __kindof Entity *obj = [self new];
    
    for( NSString *key in self.mapping ){
        NSString *property = self.mapping[key];
        id value = json[key];
        
        [obj setValue:value forKey:property];
    }

    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"unrecognized property = [%@]  mapping = %@",  key, self.class.mapping);
}

@end



