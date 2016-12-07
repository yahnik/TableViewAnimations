//
//  DetailViewController.m
//  TableViewAnimations
//
//  Created by Dan on 12/5/16.
//  Copyright © 2016 sketchead. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation DetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Yo";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.textView];
    
    self.textView.text = @"dsafsdfasd fasdfasdfa sdkf jaslkd;fj alksdf jasdf";
    self.imageView.image = [UIImage imageNamed:@"cat"];
}

- (void)dismiss
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImageView*)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _imageView.frame = ({
            CGRect frame = self.view.bounds;
            frame.size.height = CGRectGetHeight(frame) / 2.0;
            frame;
        });
    }
    
    return _imageView;
}

- (UITextView*)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.frame = ({
            CGRect frame = self.view.bounds;
            frame.size.height = CGRectGetHeight(frame) / 2.0;
            frame.origin.y = CGRectGetHeight(frame);
            frame;
        });
    }
    
    return _textView;
}

@end
