//
//  NSString+Extension.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "NSString+Extension.h"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation NSString (Extension)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (unsigned long long)unsignedLongLongValue
{
    return strtoull(self.UTF8String, NULL, 0);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@end



