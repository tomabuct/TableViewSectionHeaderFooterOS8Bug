//
//  TableViewHeaderFooterView.m
//  TableViewCellLabelLayoutBug
//
//  Created by Tom Abraham on 9/16/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "TableViewHeaderFooterView.h"

@interface TableViewHeaderFooterView ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation TableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
    _label = [[UILabel alloc] init];
    _label.text = @"hiii";
    [self.contentView addSubview:_label];
    
    [self _installConstraints];
  }
  return self;
}

- (void)_installConstraints {
  NSDictionary *const views = @{ @"label": self.label };
  
  self.label.translatesAutoresizingMaskIntoConstraints = NO;
  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[label]-5-|" options:0 metrics:nil views:views]];
  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[label]-5-|" options:0 metrics:nil views:views]];
}

@end
