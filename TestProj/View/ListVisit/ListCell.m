//
//  ListCell.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "ListCell.h"

@interface ListCell ()
@property (nonatomic, nullable, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, nullable, weak) IBOutlet UILabel *subtitleLabel;
@end

@implementation ListCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.viewModel = nil;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.viewModel = nil;
}

- (void)setViewModel:(id<ListCellViewModel>)viewModel{
    _viewModel = viewModel;
    self.titleLabel.text = viewModel.title;
    self.subtitleLabel.text = viewModel.subtitle;
    
    [self setSelected:viewModel.selected animated:YES];
}

@end



