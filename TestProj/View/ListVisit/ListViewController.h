//
//  ListViewController.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListViewControllerDelegate <NSObject>
- (void)listDidSelectItemAtIndex:(NSUInteger)index;
- (void)reloadData;
@end

@protocol ListCellViewModel;

@protocol ListViewControllerViewModel <NSObject>
@property (nonatomic, nullable, weak, readonly) id<ListViewControllerDelegate> delegate;
@property (nonatomic, nonnull, strong, readonly) NSArray< id<ListCellViewModel> > *listItems;
@end

@interface ListViewController : UITableViewController

@property (nonatomic, nonnull, copy) id<ListViewControllerViewModel> viewModel;

@end
