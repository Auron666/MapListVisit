//
//  UIViewController+Extension.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <UIKit/UIKit.h>

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface UIViewController (Extension)

- (void)addChildVC:(nonnull UIViewController *)vc;
- (void)removeChildVC:(nonnull UIViewController *)vc;

- (nonnull UINavigationController *)wrappedInNavController;

@end
