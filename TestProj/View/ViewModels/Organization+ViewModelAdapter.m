//
//  Organization+ViewModelAdapter.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <objc/runtime.h>
#import "Organization+ViewModelAdapter.h"

@implementation Organization (ViewModelAdapter)

- (CLLocation *)location{
    return [[CLLocation alloc] initWithLatitude:self.lat longitude:self.lon];
}

- (CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake(self.lat, self.lon);
}

- (BOOL)selected{
    return [objc_getAssociatedObject(self, @selector(selected)) boolValue];
}

- (void)setSelected:(BOOL)selected{
    objc_setAssociatedObject(self, @selector(selected), @(selected), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)debugDescription{
    return [self.description stringByAppendingFormat:@", selected=%@", @(self.selected)];
}

@end



