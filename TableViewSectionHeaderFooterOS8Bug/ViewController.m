//
//  ViewController.m
//  TableViewSectionHeaderFooterOS8Bug
//
//  Created by Tom Abraham on 9/16/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "ViewController.h"

#import "TableViewHeaderFooterView.h"

static NSString *const kCell = @"cell";
static NSString *const kHeaderFooter = @"headerFooter";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (instancetype)init {
  if (self = [super init]) {
    _tableView = [[UITableView alloc] init];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCell];
    [_tableView registerClass:[TableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:kHeaderFooter];
    _tableView.delegate = self;
    _tableView.dataSource = self;
  }
  return self;
}

- (void)loadView {
  self.view = self.tableView;
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *const cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
  cell.textLabel.text = @"hello";
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
}

#pragma mark UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  return [tableView dequeueReusableHeaderFooterViewWithIdentifier:kHeaderFooter];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 100;
}

@end