//
//  defines.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//


#ifndef defines_h
#define defines_h


#define SAFE_RUN(block, ...)                block ? block(__VA_ARGS__) : nil
#define SAFE_RUN_ASYNC(queue, block, ...)   block ? dispatch_async(queue, ^{ block(__VA_ARGS__); }) : nil



#endif /* defines_h */
