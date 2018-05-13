//
//  ListViewController.m
//  TestProj
//
//  Created by Benjamin Kolosov on 12.05.2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "ListViewController.h"
#import "ListCell.h"

@interface ListViewController ()
@end

@implementation ListViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"List Visit";
}

- (void)setViewModel:(id<ListViewControllerViewModel>)viewModel{
    _viewModel = viewModel;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (IBAction)refreshData:(UIRefreshControl *)sender{
    [self.viewModel.delegate reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.listItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)aCell forRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCell *cell = (ListCell *)aCell;
    cell.viewModel = self.viewModel.listItems[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel.delegate listDidSelectItemAtIndex:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel.delegate listDidSelectItemAtIndex:NSNotFound];
}

@end



