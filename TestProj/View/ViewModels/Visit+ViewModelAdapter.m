//
//  Visit+ViewModelAdapter.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <objc/runtime.h>

#import "Organization.h"
#import "Organization+ViewModelAdapter.h"
#import "Visit+ViewModelAdapter.h"

@implementation Visit (ViewModelAdapter)

- (NSString *)subtitle{
    return self.organization.title;
}

- (Organization *)organization{
    return objc_getAssociatedObject(self, @selector(organization));
}

- (void)setOrganization:(Organization *)organization{
    objc_setAssociatedObject(self, @selector(organization), organization, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)selected{
    return self.organization.selected;
}

- (NSString *)debugDescription{
    return [self.description stringByAppendingFormat:@"Selected=%@  organization=%@", @(self.selected), self.organization.debugDescription];
}

@end



