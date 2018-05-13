//
//  ListCell.h
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListCellViewModel <NSObject>
@property (nonatomic, nonnull, strong, readonly) NSString *title;
@property (nonatomic, nonnull, strong, readonly) NSString *subtitle;
@property (nonatomic, assign, readonly) BOOL selected;
@end

@interface ListCell : UITableViewCell

@property (nonatomic, nullable, copy) id<ListCellViewModel> viewModel;

@end
