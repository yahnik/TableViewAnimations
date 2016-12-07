//
//  TableViewCell.h
//  TableViewAnimations
//
//  Created by Dan on 12/6/16.
//  Copyright © 2016 sketchead. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kTableViewCellId = @"TableViewCellIdentifier";

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *thumbnailView;
@property (nonatomic, strong) UILabel *label;

@end
