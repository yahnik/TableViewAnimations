//
//  ViewController.m
//  TableViewAnimations
//
//  Created by Dan on 12/5/16.
//  Copyright © 2016 sketchead. All rights reserved.
//

#import "ViewController.h"

#import "DetailViewController.h"
#import "TransitioningAnimator.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSString*> *data;
@property (nonatomic, assign) CGRect animationBeginRect;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = self;
    
    _data = [NSMutableArray arrayWithCapacity:100];
    for (NSInteger i = 0; i < 100; i++) {
        [_data addObject:[NSString stringWithFormat:@"Row %@", @(i)]];
    }
    
    [self.view addSubview:self.tableView];
}

- (UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Hold on to the selected cell since we'll need to use its image view as a starting point
    // for the presentation.
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.animationBeginRect = [cell convertRect:cell.imageView.frame toView:nil];
    
    DetailViewController *detailPage = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailPage animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.imageView.contentMode = UIViewContentModeTopLeft;
        cell.imageView.clipsToBounds = YES;
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"cat"];
    
    return cell;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[TransitioningAnimator alloc] initWithInitialFrame:self.animationBeginRect];
    }
    
    // Don't worry about pop operations
    return nil;
}

@end
