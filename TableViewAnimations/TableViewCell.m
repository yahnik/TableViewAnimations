//
//  TableViewCell.m
//  TableViewAnimations
//
//  Created by Dan on 12/6/16.
//  Copyright © 2016 sketchead. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.thumbnailView];
        [self addSubview:self.label];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.thumbnailView.frame = ({
        // Thumbnail view will take up the top half of the cell, and 50% of the width (centered)
        CGRect frame = self.bounds;
        frame.size.height = CGRectGetHeight(frame) / 2.0;
        frame.size.width = CGRectGetWidth(frame) / 2.0;
        frame.origin.x = CGRectGetWidth(frame) / 2.0;
        frame;
    });
    
    self.label.frame = ({
        // Text label will take up bottom half of cell, full width
        CGRect frame = self.bounds;
        frame.size.height = CGRectGetHeight(frame) / 2.0;
        frame.origin.y = CGRectGetHeight(frame);
        frame;
    });
}

- (UIImageView*)thumbnailView
{
    if (!_thumbnailView) {
        // Frame will be set in layoutSubviews
        _thumbnailView = [[UIImageView alloc] init];
        _thumbnailView.contentMode = UIViewContentModeBottom;
        _thumbnailView.clipsToBounds = YES;
    }
    
    return _thumbnailView;
}

- (UILabel*)label
{
    if (!_label) {
        // Frame will be set in layoutSubviews
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    
    return _label;
}

@end
