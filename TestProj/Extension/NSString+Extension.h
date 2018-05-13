//
//  NSString+Extension.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <Foundation/Foundation.h>

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface NSString (Extension)

// used for KVC mapping from JSON (NSString -> NSUInteger)
- (unsigned long long)unsignedLongLongValue;

@end
