//
//  UIViewController+Extension.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)addChildVC:(UIViewController *)vc{
    if( [self.childViewControllers containsObject:vc] ) {
        NSLog(@"VC is already added = %@", vc);
        return;
    }

    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
}

- (void)removeChildVC:(UIViewController *)vc{
    if( ![self.childViewControllers containsObject:vc] ) {
        NSLog(@"VC is not a child = %@", vc);
        return;
    }

    [vc didMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
}

- (UINavigationController *)wrappedInNavController{
    return [[UINavigationController alloc] initWithRootViewController:self];
}

@end



